((H) ->
  H.wrap H.Series::, "drawGraph", (proceed) ->
    # Now apply the original function with the original arguments, 
    # which are sliced off this function's arguments
    proceed.apply this, Array::slice.call(arguments, 1)
    arrowLength = 15
    arrowWidth = 9
    series = this
    segments = series.linedata or series.segments
    lastSeg = segments[segments.length - 1]
    
    path = []
    lastPoint = null
    nextLastPoint = null
    lastPoint = lastSeg[lastSeg.length-1]
    nextLastPoint = lastSeg[lastSeg.length-2]
    angle = Math.atan((lastPoint.plotX - nextLastPoint.plotX) / (lastPoint.plotY - nextLastPoint.plotY))
    angle = Math.PI + angle  if angle < 0
    path.push "M", lastPoint.plotX, lastPoint.plotY
    if lastPoint.plotX > nextLastPoint.plotX
      path.push "L", lastPoint.plotX + arrowWidth * Math.cos(angle), lastPoint.plotY - arrowWidth * Math.sin(angle)
      path.push lastPoint.plotX + arrowLength * Math.sin(angle), lastPoint.plotY + arrowLength * Math.cos(angle)
      path.push lastPoint.plotX - arrowWidth * Math.cos(angle), lastPoint.plotY + arrowWidth * Math.sin(angle), "Z"
    else
      path.push "L", lastPoint.plotX - arrowWidth * Math.cos(angle), lastPoint.plotY + arrowWidth * Math.sin(angle)
      path.push lastPoint.plotX - arrowLength * Math.sin(angle), lastPoint.plotY - arrowLength * Math.cos(angle)
      path.push lastPoint.plotX + arrowWidth * Math.cos(angle), lastPoint.plotY - arrowWidth * Math.sin(angle), "Z"
    if series.arrow
      series.arrow.attr d: path
    else
      series.arrow = series.chart.renderer.path(path).attr(fill: series.color).add(series.group)
    return

  return
) Highcharts

stat_url = '/stats/get_data'

fn_init_collapse_bar = ->
  $('.collapse-button').click ->
    $(this).parents('.each-stat').toggleClass('collapsed')
    
fn_create_pie_chart = ->
  return if typeof($.fn.easyPieChart) == 'undefined'
  return if $('.pie-chart').size()<1
  size = 125
  $(".pie-chart").css
    width: size + "px"
    height: size + "px"

  $(".pie-chart .percent").css "line-height", size + "px"


  $(".pie-chart").easyPieChart
    size: size
    scaleColor: false
    trackColor: "#dddadd"
    onStart: ->
      $('.percent1', @el).remove()
      $('.down-info', @el).remove()

      $(@el).append "<div class='percent1'> \t\t\t\t\t<div class='caption'>LAST</div> \t\t\t\t\t<div class='value'>" + $(@el).attr("data-duration") + "</div> \t\t\t\t\t<div class='caption'>DAYS</div> \t\t\t\t</div>"
      $(@el).append "<div class='down-info'> \t\t\t\t\t<div class='value'>" + $(@el).attr("data-value") + "</div> \t\t\t\t\t<div class='caption'></div> \t\t\t\t</div>"
      data_stroke_color = $(@el).attr("data-storke-color")
      if data_stroke_color is "gradient"
        ctx = @renderer.getCtx()
        canvas = @renderer.getCanvas()
        gradient = ctx.createLinearGradient(0, 0, canvas.width, 0)
        gradient.addColorStop 0, "#ffe57e"
        gradient.addColorStop 0.5, "#55e57e"
        gradient.addColorStop 0.7, "#55e5ff"
        gradient.addColorStop 1, "#de5900"
        @barColor = gradient
      else
        @barColor = data_stroke_color
      return

    barColor: (percent) ->
      @barColor
  return


fn_bind_dropdown_events = ->
  $(".dropdown-caption").on 'click', ->
    $("ul.dropdown-list", this).toggle()
    return

  $("ul.dropdown-list").each ->
    $(this).attr('data-selected-id', $("li:first", this).attr('id'));
  $("ul.dropdown-list").each ->
    $(this).siblings(".text").text $("li:first", this).text();

  $(document).on 'click', "ul.dropdown-list li", ->
    $(this).parent()
      .attr('data-selected-id', $(this).attr('id'))
      .siblings(".text").text $(this).text()
    return
  return


fn_init_dates = ->
	$('.daterange').each ->
	  startDate = $(this).attr("start-date")
	  endDate = $(this).attr("end-date")
	  $("#startDate", this).text startDate
	  $("#endDate", this).text endDate
	  return


fn_create_datepickers = ->
  $(".daterange").each ->
  	$(this).daterangepicker
	    format: "MM/DD/YYYY"
	    locale:
	      applyLabel: "OK"
	      cancelLabel: "Cancel"

	    opens: "left"
	    autoApplyClickedRange: true
	    startDate: $(this).attr("start-date")
	    endDate: $(this).attr("end-date")

  $(".daterange").each ->
    $(this).on "apply.daterangepicker", (ev, picker) ->
      startDate = picker.startDate.format("MM/DD/YYYY")
      endDate = picker.endDate.format("MM/DD/YYYY")
      $(this).attr "start-date", startDate
      $(this).attr "end-date", endDate
      $("#startDate", this).text startDate
      $("#endDate", this).text endDate

      if(ev.currentTarget.id=='stat4-container')
        fn_get_stat4_data()

      if(ev.currentTarget.id=='stat7-container')
        fn_get_stat7_data()

      if(ev.currentTarget.id=='period1')
        $(ev.currentTarget).html "#{startDate} ~ #{endDate}"
        fn_get_stat5_data('stat5_1')

      if(ev.currentTarget.id=='period2')
        $(ev.currentTarget).html "#{startDate} ~ #{endDate}"
        fn_get_stat5_data('stat5_2')

      return

  fn_init_dates()
  return

fn_init_treeview = ->

fn_init_iscroll = ->
  return if $('#wrapper').size()<1 
  return if typeof(iScroll) == 'undefined'
  #window.myScroll = new iScroll("wrapper")

window.fn_create_area_chart = (category, json)->
  return if $('.stat7').size()<1
  options =
    chart:
      renderTo: "chart_container"
      type: "line"

    title:
      text: ""

    subtitle:
      text: ""

    xAxis:
      categories: []
      labels:
        align: "center"
        x: -3
        y: 20
        formatter: ->
          return @value

    yAxis:
      gridLineWidth: 0
      labels:
        enabled: false
      title:
        text: ""

    tooltip:
      enabled: false
      formatter: ->
        "<b>" + @series.name + "</b><br/>" + @x + ": " + @y

    plotOptions:
      line:
        dataLabels:
          enabled: true

        enableMouseTracking: false
        marker:
          enabled: false

    series: [
      {
        type: "line"
        width: 3
        color: "none"
        name: "AVG MIN"
        data: []
        showInLegend: false
        dataLabels:
          color: "#000"
          useHTML: true
          formatter: ->
            "<span class='chart-label "+@series.options.mmm[@point.x]+"'>"+@series.options.labels[@point.x]+"</span>"
      }
      {
        type: "line"
        width: 3
        color: "none"
        name: "AVG MIN"
        data: []
        showInLegend: false
        dataLabels:
          color: "#000"
          useHTML: true
          formatter: ->
            this.value
      }
      {
        type: "column"
        pointWidth: 1
        color: "#999999"
        name: "AVG MIN"
        data: []
        showInLegend: false
        dataLabels:
          color: "#000"
          enabled: false
      }
      {
        type: "area"
        color: "#fefefe"
        name: "AVG MIN"
        data: []
        showInLegend: false
        dataLabels:
          color: "#3497DA"
          enabled: false
      }
      {
        type: "line"
        width: 3
        lineWidth: 5
        color: "#f00"
        name: "AVG MIN"
        data: []
        showInLegend: false
        dataLabels:
          color: "#000"
          enabled: false
      }
    ]


  ###
  json = {}
  category = []
  j = 0
  while j < 24
    dt = new Date(+new Date + j * 1000 * 3600 * 24)
    dt_s = dt.getDate() + ""
    category.push dt_s
    j++
  i = undefined
  json = undefined
  json =
    name: ""
    data: []

  j = 0

  while j < 24
    json["data"].push parseInt(Math.random() * 100)
    j++
  ###

  options.series[1].name = json["name"]
  options.series[1].data = json["data"]
  options.series[2].name = json["name"]
  options.series[2].data = json["data"]
  options.series[3].name = json["name"]
  options.series[3].data = json["data"]
  options.series[4].name = json["name"]
  options.series[4].data = json["data"]
  max = -1
  min = 1000000
  k = 0

  while k < options.series[1].data.length
    max = options.series[1].data[k]  if options.series[1].data[k] > max
    min = options.series[1].data[k]  if options.series[1].data[k] < min
    k++
  mid = parseInt((max + min) / 2)
  mmm = [
    min
    mid
    max
  ]
  data = options.series[1].data
  options.series[0].name = options.series[1].name
  options.series[0].labels = []
  options.series[0].mmm = []
  k = 0


  offset_max = max/2
  offset_min = offset_max/3
  offset_mid = offset_max/3*2

  while k < data.length
    options.series[0].labels[k] = options.series[1].data[k]
    if options.series[1].data[k] is max
      options.series[0].data[k] = max + offset_max
      options.series[0].mmm[k] = 'max'
    else if options.series[1].data[k] is min
      options.series[0].data[k] = max + offset_min
      options.series[0].mmm[k] = 'min'
    else
      options.series[0].data[k] = max + offset_mid
      options.series[0].mmm[k] = 'mid'
    k++

  options.xAxis.categories = category
  window.options = options
  window.chart = new Highcharts.Chart(options)
  return


fn_get_projects_for_user = (container, user_id, fn)->
  data = {user_id: user_id, method: 'get_projects'}
  $("."+container+" .dropdown-list.projects")
    .empty()
    .hide()
  $("."+container+" .dropdown-list.projects").siblings('.text').empty()
  get_data_p stat_url, data, (response)->
    html = ""
    projects = response.projects
    for k of projects
      project = projects[k]
      console.log(project)
      html += "<li id='" + project.id + "'>" + project.name + "</li>"
    $("."+container+" .dropdown-list.projects").append html
    fn() if typeof fn == 'function'

fn_get_stat1_data = ->
  user_id = $('.stat1 ul.users').attr('data-selected-id')
  project_id = $('.stat1 ul.projects').attr('data-selected-id')
  return if !project_id
  data = {user_id: user_id, project_id: project_id, method: 'get_stat1'}

  $(".stat1 .pie-chart").each ->
    $(this).data("easyPieChart").update 0

  get_data_g '/projects/'+project_id+'/report?user_id='+user_id, (response)->
    return if !response.reports
    
    n = [
      response.reports.days_30
      response.reports.days_60
      response.reports.days_90
      response.reports.days_ytd
    ]
    

    i = 0
    while i < 4
      $(".stat1 .pie-chart:eq(" + i + ")").attr "data-value", parseInt(n[i])
      p = parseInt(n[i]/250*100)
      console.log $(".stat1 .pie-chart:eq(" + i + ")").data("easyPieChart"), p
      $(".stat1 .pie-chart:eq(" + i + ")").data("easyPieChart").update p
      i++

  return


fn_get_stat2_data = ->
  user_id = $('.stat2 ul.users').attr('data-selected-id')
  project_id = $('.stat2 ul.projects').attr('data-selected-id')
  return if !project_id
  data = {user_id: user_id, project_id: project_id, method: 'get_stat2'}

  get_data_p stat_url, data, (response)->
    return if !response
    $('.stat2 .exclamation1 .value').text(response.over_7)
    $('.stat2 .exclamation2 .value').text(response.over_30)
    $('.stat2 .exclamation3 .value').text(response.over_30_more)
  return

fn_get_stat3_data = ->
  user_id = $('.stat3 ul.users').attr('data-selected-id')
  project_id = $('.stat3 ul.projects').attr('data-selected-id')
  return if !project_id
  data = {user_id: user_id, project_id: project_id, method: 'get_stat3'}

  get_data_p stat_url, data, (response)->
    return if !response
    n = [
      response.n_30
      response.n_60
      response.n_90
    ]
    n.push n[2]
    i = 0
    while i < 4
      $(".stat3 .pie-chart:eq(" + i + ")").attr "data-value", parseInt(n[i])
      p = parseInt(n[i]/64*100)
      $(".stat3 .pie-chart:eq(" + i + ")").data("easyPieChart").update p
      i++
  return

fn_get_stat4_data = ()->
  from_s = $('.stat4 #stat4-container').attr('start-date')
  to_s = $('.stat4 #stat4-container').attr('end-date')

  project_id = $('.stat4 .projects').attr('data-selected-id');
  data = {method: 'get_stat4', from_s: from_s, to_s: to_s, project_id: project_id}

  get_data_p stat_url, data, (response)->
    return if !response.projects
    window.projects = response.projects
    $('#data-table')
      .bootstrapTable('destroy')
      .bootstrapTable data: projects, onSort: fn_rerender_stat4_data

    $('#data-table')
      .bootstrapTable('destroy')
      .bootstrapTable
        data: projects
        onSort: ->
          setTimeout fn_rerender_stat4_data, 100
          return

    fn_rerender_stat4_data()


  return

employees_list = {}
fn_rerender_stat4_data = ()->
  employees_list = {}

  $('.data-table tr:gt(0)').each(->
    employee_name = $('td:first', this).html()
    project_name = $('td:eq(1)', this).html()
    days = parseInt($('td:eq(2)', this).html())
    completed = parseInt($('td:eq(3)', this).html())
    completed_cat = parseInt($('td:eq(4)', this).html())
    issues = parseInt($('td:eq(5)', this).html())

    employees_list[employee_name] = employees_list[employee_name] or {}
    employees_list[employee_name].project_count = employees_list[employee_name].project_count + 1 or 1
    employees_list[employee_name].days = employees_list[employee_name].days 
    employees_list[employee_name].completed = employees_list[employee_name].completed + completed or completed
    employees_list[employee_name].issues = employees_list[employee_name].issues + issues or issues
    employees_list[employee_name].full_data = employees_list[employee_name].full_data or []
    employees_list[employee_name].tr_list = employees_list[employee_name].tr_list or []

    full_data =
      employee_name: employee_name
      project_name: project_name
      days: days
      completed: completed
      completed_cat: completed_cat
      issues: issues
    employees_list[employee_name].full_data.push(full_data) or []
    employees_list[employee_name].tr_list.push(this)
    return
  ).unbind('click').on 'click', ->
    employee_name = $.trim($('td', this).html())
    $(this).toggleClass 'expanded'
    if $(this).next('.next-row').size() == 0
      tr_html = ''
      if employees_list[employee_name].full_data and employees_list[employee_name].full_data.length > 0
        i = 0
        while i < employees_list[employee_name].full_data.length
          o = employees_list[employee_name].full_data[i]
          w = $('.data-table tr:gt(0) td:eq(0)').width()
          tr_html += '<tr><td width=\'' + w + '\'>' + o.employee_name + '</td>'
          w = $('.data-table tr:gt(0) td:eq(1)').width()
          tr_html += '<td width=\'' + w + '\'>' + o.project_name + '</td>'
          w = $('.data-table tr:gt(0) td:eq(2)').width()
          tr_html += '<td width=\'' + w + '\'>' + o.days + '</td>'
          w = $('.data-table tr:gt(0) td:eq(3)').width()
          tr_html += '<td width=\'' + w + '\'>' + o.completed + '</td>'
          w = $('.data-table tr:gt(0) td:eq(4)').width()
          tr_html += '<td width=\'' + w + '\'>' + o.completed_cat + '</td>'
          w = $('.data-table tr:gt(0) td:eq(5)').width()
          tr_html += '<td width=\'' + w + '\'>' + o.issues + '</td></tr>'
          i++
        table_html = '<table>' + tr_html + '</table>'
        $(this).after '<tr class=\'next-row\'><td colspan=10>' + table_html + '</td></tr>'
    else
      $(this).next('.next-row').toggle()
  
  
  for empoyee of employees_list
    empoyee = employees_list[empoyee]
    o = empoyee.tr_list[0]
    $('td:eq(0)', o).html(empoyee.employee_name)
    $('td:eq(1)', o).html(empoyee.project_count)
    $('td:eq(2)', o).html(empoyee.days)
    $('td:eq(3)', o).html(empoyee.completed)
    $('td:eq(4)', o).html(empoyee.completed_cat)
    $('td:eq(5)', o).html(empoyee.issues)


    while empoyee.tr_list.length>1
      empoyee.tr_list.pop().remove()
    
  return



fn_get_stat5_data = (container)->
  from_s = $('.'+container+' .daterange').attr('start-date')
  to_s = $('.'+container+' .daterange').attr('end-date')

  if container == 'stat5_1'
    user_id = $('.'+container+' ul.users').attr('data-selected-id')
    data = {method: 'get_stat5_1', from_s: from_s, to_s: to_s, user_id: user_id}

  if container == 'stat5_2'
    project_id = $('.'+container+' ul.projects').attr('data-selected-id')
    data = {method: 'get_stat5_2', from_s: from_s, to_s: to_s, project_id: project_id}

  get_data_p stat_url, data, (response)->
    return if !response
    $('.'+container+' .value').text response.incident_count

  return


fn_get_stat7_data = ->
  from_s = $('.stat7 #stat7-container').attr('start-date')
  to_s = $('.stat7 #stat7-container').attr('end-date')
  user_id = $('.stat7 ul.users').attr('data-selected-id')
  project_id = $('.stat7 ul.projects').attr('data-selected-id')

  data = {
    method: 'get_stat7', from_s: from_s, 
    to_s: to_s, user_id: user_id, project_id: project_id
  }

  get_data_p stat_url, data, (response)->
    return if !response
    category = response.category
    unless response.data == undefined
      $('.stat7 #chart_container').width response.data.length*50

    json =
      name: ""
      data: response.data
    $('.stat7 .last_date').text(category[0])
    fn_create_area_chart(category, json)



fn_bind_events = ->
  return if $('.stats').size() == 0
  fn_bind_dropdown_events()
  fn_bind_for_stat1()
  fn_bind_for_stat2()
  fn_bind_for_stat3()
  fn_bind_for_stat4()
  fn_bind_for_stat5()
  fn_bind_for_stat6()
  fn_bind_for_stat7()
  

fn_bind_for_stat1 = ->
  $('.stat1 .dropdown-list.users').click ->
    setTimeout ->
      user_id = $('.stat1 ul.users').attr('data-selected-id')
      fn_get_projects_for_user 'stat1', user_id, ->
        $('.stat1 .dropdown-list.projects li').click ->
          setTimeout ->
            fn_get_stat1_data()
          ,500
    ,500


  $('.stat1 .dropdown-list.projects li').click ->
    setTimeout ->
      fn_get_stat1_data()
    ,500

  fn_get_stat1_data()
  return

fn_bind_for_stat2 = ->
  $('.stat2 .dropdown-list.users').click ->
    setTimeout ->
      user_id = $('.stat2 ul.users').attr('data-selected-id')
      fn_get_projects_for_user 'stat2', user_id, ->
        $('.stat2 .dropdown-list.projects li').click ->
          setTimeout ->
            fn_get_stat2_data()
          ,500
    ,500

  $('.stat2 .dropdown-list.projects li').click ->
    setTimeout ->
      fn_get_stat2_data()
    ,500

  fn_get_stat2_data()
  return

fn_bind_for_stat3 = ->
  $('.stat3 .dropdown-list.users').click ->
    setTimeout ->
      user_id = $('.stat3 ul.users').attr('data-selected-id')
      fn_get_projects_for_user 'stat3', user_id, ->
        $('.stat3 .dropdown-list.projects li').click ->
          setTimeout ->
            fn_get_stat3_data()
          ,500
    ,500

  $('.stat3 .dropdown-list.projects li').click ->
    setTimeout ->
      fn_get_stat3_data()
    ,500

  fn_get_stat3_data()
  return

fn_bind_for_stat4 = ->
  $('.stat4 .dropdown-list.projects li').click ->
    setTimeout ->
      fn_get_stat4_data()
    ,500

  fn_get_stat4_data()
  return

fn_bind_for_stat5 = ->
  $(document).on 'click', '.stat5_1 .dropdown-list.users' , () ->
    setTimeout ->
      fn_get_stat5_data('stat5_1')
    ,500

  $(document).on 'click', '.stat5_2 .dropdown-list.projects' , () ->
    setTimeout ->
      fn_get_stat5_data('stat5_2')
    ,500

  #fn_get_stat5_data('stat5_1')
  #fn_get_stat5_data('stat5_2')
  return


fn_bind_for_stat6 = ->
  $('.stat6 .search').keypress (e) ->
    if e.keyCode == 13
      fn_find_issue(e.target.value)

  $('.stat6 .issue-info .close-icon').click ->
    $('.stat6 .issue-detail .start-date').html ''
    $('.stat6 .issue-detail .completed-date').html ''
    $('.stat6 .issue-info .issue-name').html ''
  
  fn_find_issue('')


fn_bind_for_stat7 = ->
  $('.stat7 .dropdown-list.users').click ->
    setTimeout ->
      user_id = $('.stat7 ul.users').attr('data-selected-id')
      fn_get_projects_for_user 'stat7', user_id, ->
        $('.stat7 .dropdown-list.projects li').click ->
          setTimeout ->
            fn_get_stat7_data()
          ,500
    ,500


  $('.stat7 .dropdown-list.projects li').click ->
    setTimeout ->
      fn_get_stat7_data()
    ,500

  fn_get_stat7_data()
  return


fn_find_issue = (key)->
  data = {method: 'get_issues', key: key}

  get_data_p stat_url, data, (response)->
    return if !response
    projects = response.projects
    html = ""
    for k of projects
      project = projects[k]
      project_name = project.name
      html += "<li id='#{project.id}' class='project'>#{project.name}"

      incidents = project.incidents
      if incidents.length > 0
        html += "<div class='expander'></div><ul class='expanded'>"
        for i of incidents
          incident = incidents[i]
          incident_data = JSON.stringify(incident)
          html += "<li id='#{incident.id}' data='#{incident_data}' class='incident'>#{incident.name}</li>"
        html += "</ul>"
      html += "</li>"
    $('ul.tree')
      .empty()
      .html html
    $('.stat6 .tree li.incident').click ->
      $('.stat6 .tree li.incident').removeClass 'selected'
      $(this).addClass('selected')
      incident = JSON.parse($(this).attr('data'))
      
      incident_name = incident.name
      start_date = incident.injury_date
      completed_date = incident.created_at

      day_count = Math.abs(parseInt((moment(completed_date) - moment(start_date))/3600/24/1000))

      #day_count = 1 if day_count == 0

      $('.stat6 .issue-detail .start-date').html moment(start_date).format('MM/DD/YYYY')
      $('.stat6 .issue-detail .completed-date').html moment(completed_date).format('MM/DD/YYYY')
      $('.stat6 .issue-detail .day-count').html day_count
      $('.stat6 .issue-info .issue-name').html incident_name
    #window.myScroll.refresh()




fn_init_bootstrap_table = ->
  jQuery('[data-toggle="table"]').bootstrapTable()

ready = ->
  if $('.stats').size()>0
    $('.main-container').css
      padding: 0
  else
    $('.main-container').css
      padding: 20

  fn_create_pie_chart()
  fn_create_datepickers()
  fn_init_treeview()
  fn_init_iscroll()
  fn_init_collapse_bar()
  fn_init_bootstrap_table()









  category = [
    "7"
    "8"
    "9"
    "10"
    "11"
    "12"
    "13"
    "14"
    "15"
    "16"
    "17"
    "18"
    "19"
    "20"
    "21"
    "22"
    "23"
    "24"
    "25"
    "26"
    "27"
    "28"
    "29"
    "30"
  ]
  json =
    name: ""
    data: [
      72
      61
      28
      28
      94
      64
      32
      76
      88
      45
      5
      45
      82
      87
      91
      15
      30
      1
      5
      95
      31
      12
      8
      47
    ]

  fn_create_area_chart(category, json)
  fn_bind_events()

  return

$(document).ready(ready)
$(document).on('page:load', ready)

