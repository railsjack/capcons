# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
		User.create!(username: "admin",first_name: "Admin", email: "admin@gmail.com", password: "password", password_confirmation: "password", role: "admin")







#create categories and their questions
category = Category.create!(name: "Admin")
[	
	"Are computer workstations, background and screen lighting compatible and adjustable?", 
	"Are computer screen positions, chairs, and keyboard adjustable?", 
	"Has employee training been provided on preventing problems associated with computer screen use?", 
	"Are workplaces kept free of debris, floor storage, and electrical cords?", 
	"Has adequate aisle space been maintained?", 
	"Are file cabinets anchored to prevent tipping and drawers are opened one at a time and closed when work is finished?", 
	"Is neutral posture checked while using the computer?", 
	"Is the heaviest material stored in bottom drawers of the file cabinet?", 
	"Are employees avoiding overexertion and strain when lifting and carrying loads by using proper lifting techniques?", 
	"Do employees practice defensive driving and are seat belts/ shoulder harnesses worn at all times?", 
	"Are vehicles locked when unattended to avoid theft?", 
	"Are vehicles parked in legal spaces so they do not obstruct traffic?", 
	"Do employees park their vehicles in well-lighted areas and/or near entrances to avoid criminal misconduct?", 
	"Are fire extinguisher areas kept clear at all times?", 
	"Are means of egress kept unblocked, well lighted and unlocked during work hours?", 
	"Are excessive combustibles (paper) not stored in work areas?", 
	"Is electrical machinery in good condition and properly grounded?", 
	"Are electric cords and phone cables secured to prevent tripping hazards?", 
	"Are aisles and hallways kept clear at all times?", 
	"Are stairways equipped with non-slip treads and handrails?", 
	"Are safety treads provided on all step stools and stepladders?", 
	"Are designated employees trained to respond to a fire or other emergency?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Agriculture (Equipment Operators)")
[
	"Do tractors have roll over bars installed?", 
	"Have seat belts been installed on tractors?", 
	"Do tractors have positive locking brakes?", 
	"Are there guards on all moving parts on tractors, power take-offs and other equipment?", 
	"Are seat belts always used when operating tractors?", 
	"Are parking brakes always set when leaving equipment?", 
	"Are employees prohibited from removing or tampering with guards?", 
	"Are extra riders prohibited from traveling with the equipment operator (unless rider is being trained or assisting and the rider is in safe position)?", 
	"Is the equipment clear before starting up?", 
	"Are engines and power sources deactivated before maintenance is done?", 
	"Is the equipment kept at least 20 feet away from power lines?", 
	"Are vehicles turned off when refueling?", 
	"Is smoking not permitted during refueling?", 
	"Is fuel vapor inhalation controlled when refueling?", 
	"Are hearing protection devices worn as required when operating noisy equipment?", 
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Agriculture (Field Work)")
[
	"Are hand-held tools kept in good condition?", 
	"Are short-handled hoes not used for cultivation?", 
	"Is there a first aid kit with all appropriate items nearby?", 
	"Are employees prohibited from using pesticides unless trained and approved by the supervisor?", 
	"Are employees prohibited from entering pesticide-treated fields until the pesticide is dry or settled, or according to posted reentry intervals?",
	"Are pesticides mixed per label instructions and training?", 
	"Are pesticide applicators wearing safety equipment (gloves, respirators, clothing) as appropriate?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Carpentry")
[
	"Is the portable power saw blade upper half permanently guarded; and the bottom half has a hinged guard?", 
	"Do radial arm and table saws have anti-kickback devices installed?",
	"Are exposed saw teeth covered by hoods or guards?",
	"Are employees trained in proper saw use and safety before working unsupervised?",
	"Are safety devices installed on all pneumatic nailers and staplers?",
	"Are pneumatic tools disconnected from air supplies when not in use?",
	"Are safety glasses with side shields worn at all times?",
	"Are employees prohibited from removing any guard or safety device?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Clearing and Grubbing")
[
	"Have all underground commodities, excavation limits, and buffer zones been identified on the excavation field map, and painted/marked out on the ground?",
	"Has operator performed required daily equipment inspection?",
	"Are equipment operators aware of dead or unhealthy trees that are still standing that need to be pushed over?",
	"Are personnel aware that pests such as wasps, yellow jackets, and ants may be present?",
	"Are equipment operators aware of stumps and other potential hidden objects?",
	"Are back-up alarms working properly and/or flagman in place where necessary?",
	"Are personnel wearing orange vests and proper PPE?",
	"Is the operation checked periodically to ensure the prevention of damage to adjacent property and environmentally sensitive areas?",
	"Have the limits of the clearing and grubbing been clearly marked?", 
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Compressed Air Receivers")
[
	"Is every receiver equipped with a pressure gauge and with one or more automatic, spring-loaded safety valves?",
	"Is the total relieving capacity of the safety valve capable of preventing pressure in the receiver from exceeding the maximum allowable working pressure of the receiver by more than 10 percent?",
	"Is every air receiver provided with a drainpipe and valve at the lowest point for the removal of accumulated oil and water?",
	"Are compressed air receivers periodically drained of moisture and oil?",
	"Are all safety valves tested frequently and at regular intervals to determine whether they are in good operating condition?",
	"Is there a current operating permit issued by the Division of Occupational Safety and Health?",
	"Is the inlet of air receivers and piping systems kept free of accumulated oil and carbonaceous materials?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Compressed Gas and Cylinders")
[
	"Are cylinders with a water weight capacity over 30 pounds equipped with means for connecting a valve protector device, or with a collar or recess to protect the valve?",
	"Are cylinders legibly marked to clearly identify the gas contained?", 
	"Are compressed gas cylinders stored in areas which are protected from external heat sources such as flame impingement, intense radiant heat, electric arcs, or high temperature lines?", 
	"Are cylinders located or stored in areas where they will not be damaged by passing or falling objects, or subject to tampering by unauthorized persons?", 
	"Are cylinders stored or transported in a manner to prevent them creating a hazard by tipping, falling or rolling?", 
	"Are cylinders containing liquefied fuel gas, stored or transported in a position so that the safety relief device is always in direct contact with the vapor space in the cylinder?", 
	"Are valve protectors always placed on cylinders when the cylinders are not in use or connected for use?", 
	"Are all valves closed off before a cylinder is moved, when the cylinder is empty, and at the completion of each job?", 
	"Are low pressure fuel-gas cylinders checked periodically for corrosion, general distortion, cracks, or any other defect that might indicate a weakness or render it unfit for service?", 
	"Does the periodic check of low pressure fuel-gas cylinders include a close inspection of the cylinders' bottom?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Compressors")
[
	"Are compressors equipped with pressure relief valves, and pressure gauges?", 
	"Are compressor air intakes installed and equipped to ensure that only clean uncontaminated air enters the compressor?", 
	"Are air filters installed on the compressor intake?", 
	"Are compressors operated and lubricated in accordance with the manufacturer's recommendations?", 
	"Are safety devices on compressed air systems checked frequently?", 
	"Before any repair work is done on the pressure system of a compressor, is the pressure bled off and the system locked-out?", 
	"Are signs posted to warn of the automatic starting feature of the compressors?", 
	"Is the belt drive system totally enclosed to provide protection for the front, back, top, and sides?", 
	"Is it strictly prohibited to direct compressed air towards a person?", 
	"Are employees prohibited from using highly compressed air for cleaning purposes?", 
	"If compressed air is used for cleaning off clothing, is the pressure reduced to less than 10 psi?", 
	"When using compressed air for cleaning, do employees use personal protective equipment?", 
	"Are safety chains or other suitable locking devices used at couplings of high pressure hose lines where a connection failure would create a hazard?", 
	"Before compressed air is used to empty containers of liquid, is the safe working pressure of the container checked?", 
	"When compressed air is used with abrasive blast cleaning equipment, is the operating valve a type that must be held open manually?", 
	"When compressed air is used to inflate auto tires, is a clip-on chuck and an inline regulator preset to 40 psi required?", 
	"Is it prohibited to use compressed air to clean up or move combustible dust if such action could cause the dust to be suspended in the air and cause a fire or explosion hazard?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Concrete Cutting")
[
	"Is the blade guard present and intact?", 
	"Is the guard firmly attached to the saw?", 
	"Is the proper size blade collar being used?",
	"Does the blade shaft collar show excessive wear?",
	"Is there a tight fit of the shaft in the bearings?",
	"Does the shaft shift in the bearings?",
	"Is there  excessive or uneven wear on the wheels?" ,
	"Is the area adequately protected from pedestrians?" ,
	"Are safety glasses being worn?",
	"Is a hard hat being worn?",
	"Is the worker using a respiratory protection device?",
	"Are steel-toed work shoes/boots being worn?",
	"Is a Hi-visibility safety vest being worn?",
	"Is there adequate lighting for the job?" 
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Confined Spaces")
[
	"Are confined spaces thoroughly emptied of any corrosive or hazardous substances, such as acids or caustics, before entry?",
	"Before entry, are all lines to a confined space, containing inert, toxic, flammable, or corrosive materials valved off and blanked or disconnected and separated?",
	"Is it required that all impellers, agitators, or other moving equipment inside confined spaces be locked-out if they present a hazard?",
	"Is either natural or mechanical ventilation provided prior to confined space entry?",
	"Before entry, are appropriate atmospheric tests performed to check for oxygen deficiency, toxic substance and explosive concentrations in the confined space before entry?",
	"Is adequate illumination provided for the work to be performed in the confined space?",
	"Is the atmosphere inside the confined space frequently tested or continuously monitored?",
	"Is there an assigned safety standby employee outside of the confined space, whose sole responsibility is to watch the work in progress, sound an alarm if necessary, and render assistance?",
	"Is the standby employee or other employees prohibited from entering the confined space without lifelines and respiratory equipment if there is any questions as to the cause of an emergency?",
	"In addition to the standby employee, is there at least one other trained rescuer in the vicinity?",
	"Are all rescuers appropriately trained and using approved, recently inspected equipment?",
	"Does all rescue equipment allow for lifting employees vertically from a top opening?",
	"Are there trained personnel in First Aid and CPR immediately available?",
	"Is there an effective communication system in place whenever respiratory equipment is used and the employee in the confined space is out of sight of the standby person?",
	"Is approved respiratory equipment required if the atmosphere inside the confined space cannot be made acceptable?",
	"Is all portable electrical equipment used inside confined spaces either grounded and insulated, or equipped with ground fault protection?",
	"Before gas welding or burning is started in a confined space, are hoses checked for leaks, compressed gas bottles forbidden inside of the confined space, torches lighted only outside of the confined area and the confined area tested for an explosive atmosphere each time before a lighted torch is to be taken into the confined space?",
	"If employees will be using oxygen-consuming equipment such as salamanders, torches, furnaces, in a confined space, is sufficient air provided to assure combustion without reducing the oxygen concentration of the atmosphere below 19.5 percent by volume?",
	"Whenever combustion-type equipment is used in a confined space, are provisions made to ensure the exhaust gases are vented outside of the enclosure?",
	"Is each confined space checked for decaying vegetation or animal matter, which may produce methane?",
	"Is the confined space checked for possible industrial waste, which could contain toxic properties?",
	"If the confined space is below the ground and near areas where motor vehicles will be operating, is it possible for vehicle exhaust or carbon monoxide to enter the space?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end


category = Category.create!(name: "Cranes")
[
	"Are the cranes visually inspected for defective components prior to the beginning of any work shift?",
	"Are all electrically operated cranes effectively grounded? ",
	"Are operating controls clearly identified?",
	"Is a fire extinguisher provided at the operator's station?",
	"Is the rated capacity visibly marked on each crane?",
	"Is an audible warning device mounted on each crane?",
	"Is sufficient illumination provided for the operator to perform the work safely?",
	"Are cranes of such design, that the boom could fall over backward, equipped with boomstops?",
	"Does each crane have a certificate indicating that required testing and examinations have been performed?",
	"Are crane inspection and maintenance records maintained and available for inspection?",
	"Is a crane preventive maintenance program established?",
	"Is the load chart clearly visible to the operator?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Demolition")
[
	"Has a competent supervisor, experienced in demolition work, been appointed?",
	"Are all onsite employees sufficiently trained and competent to complete their tasks and duties safely?",
	"Is on-going hazard management being conducted onsite, and communicated through to employees and contractors effectively?",
	"Is the site properly enclosed and are protective screens erected?",
	"Have danger notices been erected? Is all access to the site by the public barred?",
	"If required, is there sufficient propping to prevent premature structural collapse or damage to adjacent property?",
	"Are all ladders and other equipment in good order?",
	"Are any floors in danger of being overloaded?",
	"Are all non-essential personnel (except the crane operator and dogman) clear of the danger area when the crane is being used?",
	"Are pedestrians adequately protected?",
	"Is sufficient watering taking place to keep down dust?",
	"Are there sufficient fire extinguishers or other fire-fighting equipment onsite, and are they readily accessible?",
	"Are good housekeeping practices being maintained, for example: are floors and access pathways clear of unnecessary debris and materials/equipment?",
	"Do plant and equipment being used onsite have daily checks conducted by the operator(s) to ensure proper running conditions and safety for use?",
	"Do all onsite elevated work platforms and cranes have current certification to verify safety for use?",
	"Prior to the commencement of any demolition work has the contractor developed a work plan for the job?",
	"Has the building or structure been cleared of asbestos containing materials?",
	"Have other likely hazardous contaminants been identified?",
	"Have all septic or underground storage tanks been verified for their location, structural condition and contents?",
	"Has the electrical power and gas lines been completely disconnected by the utilities companies?",
	"Has the residual gas, in the premises pipes, been safely flushed out?",
	"Are fire services provided?",
	"Has a structural engineer determined the loading capacity of floors before placing earthmoving equipment, heavy plant or building rubble on them?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Electrical")
[
	"Are your workplace electricians familiar with the Cal/OSHA Electrical Safety Orders?",
	"Do you specify compliance with Cal/OSHA for all contract electrical work?",
	"Are all employees required to report as soon as practicable any obvious hazard to life or property observed in connection with electrical equipment or lines?",
	"Are employees instructed to make preliminary inspections and/or appropriate tests to determine what conditions exist before starting work on electrical equipment or lines?",
	"When electrical equipment or lines are to be serviced, maintained or adjusted, are necessary switches opened, locked-out and tagged whenever possible?",
	"Are portable electrical tools and equipment grounded or of the double insulated type?",
	"Are electrical appliances such as vacuum cleaners, polishers, vending machines grounded?",
	"Do extension cords being used have a grounding conductor?",
	"Are multiple plug adapters prohibited?",
	"Are ground-fault circuit interrupters installed on each temporary 15 or 20 ampere, 120 volt AC circuit at locations where construction, demolition, modifications, alterations or excavations are being performed?",
	"Are all temporary circuits protected by suitable disconnecting switches or plug connectors at the junction with permanent wiring?",
	"Is exposed wiring and cords with frayed or deteriorated insulation repaired or replaced promptly?",
	"Are flexible cords and cables free of splices or taps?",
	"Are clamps or other securing means provided on flexible cords or cables at plugs, receptacles, tools, and equipment and is the cord jacket securely held in place?",
	"Are all cord, cable and raceway connections intact and secure?",
	"In wet or damp locations, are electrical tools and equipment appropriate for the use or location or otherwise protected?",
	"Is the location of electrical power lines and cables (overhead, underground, underfloor, other side of walls) determined before digging, drilling or similar work is begun?",
	"Are metal measuring tapes, ropes, handlines or similar devices with metallic thread woven into the fabric prohibited where they could come in contact with energized parts of equipment or circuit conductors?",
	"Is the use of metal ladders prohibited in area where the ladder or the person using the ladder could come in contact with energized parts of equipment, fixtures or circuit conductors?",
	"Are all disconnecting switches and circuit breakers labeled to indicate their use or equipment served?",
	"Are disconnecting means always opened before fuses are replaced?",
	"Do all interior wiring systems include provisions for grounding metal parts of electrical raceways, equipment and enclosures?",
	"Are all electrical raceways and enclosures securely fastened in place?",
	"Are all energized parts of electrical circuits and equipment guarded against accidental contact by approved cabinets or enclosures?",
	"Is sufficient access and working space provided and maintained about all electrical equipment to permit ready and safe operations and maintenance?",
	"Are all unused openings (including conduit knockouts) in electrical enclosures and fittings closed with appropriate covers, plugs or plates?",
	"Are electrical enclosures such as switches, receptacles, junction boxes, etc., provided with tight-fitting covers or plates?",
	"Are disconnecting switches for electrical motors in excess of two horsepower, capable of opening the circuit when the motor is in a stalled condition, without exploding? (Switches must be horsepower rated equal to or in excess of the motor hp rating).",
	"Is low voltage protection provided in the control device of motors driving machines or equipment, which could cause probably injury from inadvertent starting?",
	"Is each motor disconnecting switch or circuit breaker located within sight of the motor control device?",
	"Is the controller for each motor in excess of two horsepower, rated in horsepower equal to or in excess of the rating of the motor is serves?",
	"Are employees who regularly work on or around energized electrical equipment or lines instructed in the cardiopulmonary resuscitation (CPR) methods?",
	"Are employees prohibited from working alone on energized lines or equipment over 600 volts?",
	"Is each motor located within sight of its controller or the controller disconnecting means capable of being locked in the open position or is a separate disconnecting means installed in the circuit within sight of the motor?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end


category = Category.create!(name: "Elevated Surfaces")
[
	"Are signs posted, when appropriate, showing the elevated surface load capacity?",
	"Are surfaces elevated more than 30 inches above the floor or ground provided with standard guardrails?",
	"Are all elevated surfaces (beneath which people or machinery could be exposed to falling objects) provided with standard 4-inch toeboards?",
	"Is a permanent means of access and egress provided to elevated storage and work surfaces?",
	"Is required headroom provided where necessary?",
	"Is material on elevated surfaces piled, stacked or racked in a manner to prevent it from tipping, falling, collapsing, rolling or spreading?",
	"Are dock boards or bridge plates used when transferring materials between docks and trucks or rail cars?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Emergency Action Plan")
[
	"Are you required to have an emergency action plan?",
	"Have emergency escape procedures and routes been developed and communicated to all employers?",
	"Do employees, who remain to operate critical plant operations before they evacuate, know the proper procedures?",
	"Is the employee alarm system that provides a warning for emergency action recognizable and perceptible above ambient conditions?",
	"Are alarm systems properly maintained and tested regularly?",
	"Is the emergency action plan reviewed and revised periodically?",
	"Do employees know their responsibilities for reporting emergencies?"
].each do |question_name|
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Employer Posting")
[
"Is the OSHA poster Safety and Health Protection on the Job displayed in a prominent location where all employees are likely to see it?",
"Are emergency telephone numbers posted where they can be readily found in case of emergency?",
"Where employees may be exposed to toxic substances, has information concerning employee access to medical records & Material Safety Data Sheets been posted or made readily available?",
"Are signs concerning exiting from buildings, room capacities, floor loading, and exposures to x-ray, microwave, or other harmful radiation or substances posted where appropriate?",
"Are Industrial Welfare Commission orders regulating wages, hours, and working conditions posted?",
"Is the poster for discrimination in employment prohibited by law posted?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Environmental Controls")
[
"Are all work areas properly illuminated?",
"Are employees instructed in proper first aid and other emergency procedures?",
"Are hazardous substances identified which may cause harm by inhalation, ingestion, skin absorption or contact?",
"Are employees aware of the hazards involved with the various chemicals they may be exposed to in their work environment, such as ammonia, chlorine, epoxies, and caustics?",
"Is employee exposure to chemicals in the workplace kept within acceptable levels?",
"Can a less harmful method or product be used?",
"Is the work area's ventilation system appropriate for the work being performed?",
"Are spray painting operations done in spray rooms or booths equipped with an appropriate exhaust system?",
"Is employee exposure to welding fumes controlled by ventilation, use of respirators, exposure time, or other means?",
"Are welders and other workers nearby provided with flash shields during welding operations?",
"If forklifts and other vehicles are used in buildings or other enclosed areas, are the carbon monoxide levels kept below maximum acceptable concentration?",
"Has there been a determination that noise levels in the facilities are within acceptable levels?",
"Are steps being taken to use engineering controls to reduce excessive noise levels?",
"Are proper precautions being taken when handling asbestos and other fibrous materials?",
"Are caution labels and signs used to warn of asbestos?",
"Are wet methods used, when practicable, to prevent the emission of airborne asbestos fibers, silica dust and similar hazardous materials?",
"Is vacuuming with appropriate equipment used whenever possible rather than blowing or sweeping dust?",
"Are grinders, saws, and other machines that produce respirable dusts vented to an industrial collector or central exhaust system?",
"Are all local exhaust ventilation systems designed and operating properly such as airflow and volume necessary for the application?" ,
"Is personal protective equipment provided, used and maintained wherever required?",
"Are there written standard operating procedures for the selection and use of respirators where needed?",
"Are restrooms and washrooms kept clean and sanitary?",
"Is all water provided for drinking, washing, and cooking potable?",
"Are all outlets for water not suitable for drinking clearly identified?",
"Are employees' physical capacities assessed before being assigned to jobs requiring heavy work?",
"Are employees instructed in the proper manner of lifting heavy objects?",
"Where heat is a problem, have all fixed work areas been provided with spot cooling or air conditioning?",
"Are employees screened before assignment to areas of high heat to determine if their health condition might make them more susceptible to having an adverse reaction?",
"Are employees working on streets and roadways where they are exposed to the hazards of traffic, required to wear bright colored (traffic orange) warning vest?",
"Are exhaust stacks and air intakes located so contaminated air will not be recirculated within a building or other enclosed area?",
"Is equipment producing ultra-violet radiation properly shielded?",
"Are the ducts free of obstructions or the belts slipping?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Ergonomics")
[
"Can the work be performed without eyestrain or glare by the employees?",
"Does the task require prolonged raising of the arms?",
"Do the neck and shoulders have to be stooped to view the task?",
"Are there pressure points on any parts of the body (wrists, forearms, back of thighs)?",
"Can the work be done using the larger muscles of the body?",
"Can the work be done without twisting or overly bending the lower back?",
"Are there sufficient rest breaks, in addition to the regular rest breaks, to relieve stress from repetitive-motion tasks?",
"Are tools, instruments and machinery shaped, positioned and handled so that tasks can be performed comfortably?",
"Are all pieces of furniture adjusted, positioned and arranged to minimize strain on all parts of the body?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Excavation")
[
"Have the utility companies been adequately notified and the area marked?",
"Has a permit been issued for excavation 5 feet or deeper?",
"Are walls of trenches and excavations shored, benched or sloped to avoid cave-ins?",
"Are spoils piles at least 2 feet from the edge of any excavation?",
"Are excavations kept away from building foundations, walls and sidewalks?",
"Are physical barriers erected around excavations?",
"Are employees prohibited from riding in power shovels, backhoe buckets or other equipment not designated for this purpose?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Exit Doors")
[
"Are doors that are required to serve as exits designed and constructed so that the way of exit travel is obvious and direct?",
"Are windows that could be mistaken for exit doors, made inaccessible by means of barriers or railings?",
"Do exit doors open from the direction of exit travel without the use of a key or any special knowledge or effort, when the building is occupied?",
"Is a revolving, sliding or overhead door prohibited from serving as a required exit door?",
"Where panic hardware is installed on a required exit door, will it allow the door to open by applying a force of 15 pounds or less in the direction of the exit traffic?",
"Are doors on cold storage rooms provided with an inside release mechanism that will release the latch and open the door even if it's padlocked or otherwise locked on the outside?",
"Where exit doors open directly onto any street, alley or other area where vehicles may be operated, are adequate barriers and warnings provided to prevent employees stepping into the path of traffic?",
"Are doors that swing in both directions and are located between rooms where there is frequent traffic, provided with viewing panels in each door?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Exits and Egress")
[
"Are all exits marked with an exit sign and illuminated by a reliable light source?",
"Are the directions to exits, when not immediately apparent, marked with visible signs?",
"Are doors, passageways or stairways, that are neither exits nor access to exits and which could be mistaken for exits, appropriately marked (NOT AN EXIT), (TO BASEMENT), (STOREROOM), and the like?",
"Are exit signs provided with the word (EXIT) in lettering at least 5 inches high and the stroke of the lettering at least 1/2 inch wide?",
"Are exit doors side-hinged?",
"Are all exits kept free of obstructions?",
"Are at least two means of egress provided from elevated platforms, pits or rooms where the absence of a second exit would increase the risk of injury from hot, poisonous, corrosive, suffocating, flammable, or explosive substances?",
"Are there sufficient exits to permit prompt escape in case of emergency?",
"Are special precautions taken to protect employees during construction and repair operations?",
"Is the number of exits from each floor of a building, and the number of exits from the building itself, appropriate for the building occupancy load?",
"Are exit stairways which are required to be separated from other parts of a building enclosed by at least two hour fire-resistive construction in buildings more than four stories in height, and not less than one-hour fire resistive construction elsewhere?",
"When ramps are used as part of required exiting from a building, is the ramp slope limited to 1- foot vertical and 12 feet horizontal?",
"Where exiting will be through frameless glass doors, glass exit doors, storm doors, and such are the doors fully tempered and meet the safety requirements for human impact?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Fire Protection")
[
"Do you have a fire prevention plan?",
"Does your plan describe the type of fire protection equipment and/or systems?",
"Have you established practices and procedures to control potential fire hazards and ignition sources?",
"Are employees aware of the fire hazards of the material and processes to which they are exposed?",
"Is your local fire department well acquainted with your facilities, location and specific hazards?",
"If you have a fire alarm system, is it tested at least annually?",
"If you have a fire alarm system, is it certified as required?",
"If you have interior standpipes and valves, are they inspected regularly?",
"If you have outside private fire hydrants, are they flushed at least once a year and on a routine preventive maintenance schedule?",
"Are fire doors and shutters in good operating condition?",
"Are fire doors and shutters unobstructed and protected against obstructions, including their counterweights?",
"Are fire door and shutter fusible links in place?",
"Are automatic sprinkler system water control valves, air and water pressures checked weekly/periodically as required?",
"Is maintenance of automatic sprinkler system assigned to responsible persons or to a sprinkler contractor?",
"Are sprinkler heads protected by metal guards, when exposed to physical damage?",
"Is proper clearance maintained below sprinkler heads?",
"Are portable fire extinguishers provided in adequate number and type?",
"Are fire extinguishers mounted in readily accessible locations?",
"Are fire extinguishers recharged regularly and noted on the inspection tag?",
"Are employees periodically instructed in the use of extinguishers and fire protection procedures?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "First Aid")
[
"Is there a hospital, clinic, or infirmary for medical care in proximity of your workplace?",
"If medical and first aid facilities are not in proximity of the workplace is at least one employee on each shift currently qualified to render first aid?",
"Are medical personnel readily available for advice and consultation on matters of employees' health?",
"Are emergency phone numbers posted?",
"Are first aid kits easily accessible to each work area, with necessary supplies available, periodically inspected and replenished as needed?",
"Have first aid kit supplies been approved by a physician, indicating that they are adequate for a particular area or operation?",
"Are means provided for quick drenching or flushing of the eyes and body in areas where corrosive liquids or materials are handled?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Flammable Materials")
[
"Are combustible scrap, debris and waste materials (i.e. oily rags) stored in covered metal receptacles and removed from the worksite promptly?",
"Is proper storage practiced to minimize the risk of fire including spontaneous combustion?",
"Are approved containers and tanks used for the storage and handling of flammable and combustible liquids?",
"Are all connections on drums and combustible liquid piping, vapor and liquid tight?",
"Are all flammable liquids kept in closed containers when not in use (e.g. parts cleaning tanks, pans)?",
"Are bulk drums of flammable liquids grounded and bonded to containers during dispensing?",
"Do storage rooms for flammable and combustible liquids have explosion-proof lights?",
"Do storage rooms for flammable and combustible liquids have mechanical or gravity ventilation?",
"Is liquefied petroleum gas stored, handled, and used in accordance with safe practices and standards?",
"Are liquefied petroleum storage tanks guarded to prevent damage from vehicles?",
"Are all solvent wastes and flammable liquids kept in fire-resistant covered containers until they are removed from the worksite?",
"Is vacuuming used whenever possible rather than blowing or sweeping combustible dust?",
"Are fire separators placed between containers of combustibles or flammables, when stacked one upon another, to assure their support and stability?",
"Are fuel gas cylinders and oxygen cylinders separated by distance, fire resistant barriers or other means while in storage?",
"Are fire extinguishers selected and provided for the types of materials in areas where they are to be used?",
"Are Class A extinguishers only used for ordinary combustible material fires?",
"Are Class B extinguisers only used for flammable liquid, gas or grease fires?",
"Are Class C extinguisers only used for energized-electrical equipment fires?",
"If a Halon 1301 fire extinguisher is used, can employees evacuate within the specified time for that extinguisher?",
"Are appropriate fire extinguishers mounted within 75 feet of outside areas containing flammable liquids, and within 10 feet of any inside storage area for such materials?",
"Is the transfer/withdrawal of flammable or combustible liquids performed by trained personnel?",
"Are fire extinguishers mounted so that employees do not have to travel more than 75 feet for a class 'A' fire or 50 feet for a class 'B' fire?",
"Are employees trained in the use of fire extinguishers?",
"Are extinguishers free from obstructions or blockage?",
"Are all extinguishers serviced, maintained and tagged at intervals not to exceed one year?",
"Are all extinguishers fully charged and in their designated places?",
"Is a record maintained of required monthly checks of extinguishers?",
"Where sprinkler systems are permanently installed, are the nozzle heads directed or arranged so that water will not be sprayed into operating electrical switchboards and equipment?",
"Are 'NO SMOKING' signs posted where appropriate in areas where flammable or combustible materials are used or stored?",
"Are 'NO SMOKING' signs posted on liquefied petroleum gas tanks?",
"Are 'NO SMOKING' rules enforced in areas involving storage and use of flammable materials?",
"Are safety cans used for dispensing flammable or combustible liquids at a point of use?",
"Are all spills of flammable or combustible liquids cleaned up promptly?",
"Are storage tanks adequately vented to prevent the development of excessive vacuum or pressure as a result of filling, emptying, or atmosphere temperature changes?",
"Are storage tanks equipped with emergency venting that will relieve excessive internal pressure caused by fire exposure?",
"Are spare portable or butane tanks, which are used by industrial trucks stored in accord with regulations?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Floor & Stair Openings")
[
"Are floor openings guarded by a cover, guardrail, or equivalent on all sides (except at entrance to stairways or ladders)?",
"Are toeboards installed around the edges of a permanent floor opening (where persons may pass below the opening)?",
"Are skylight screens of such construction and mounting that they will withstand a load of at least 200 pounds?",
"Is the glass in windows, doors, glass walls that are subject to human impact, of sufficient thickness and type for the condition of use?",
"Are grates or similar type covers over floor openings such as floor drains, of such design that foot traffic or rolling equipment will not be affected by the grate spacing?",
"Are unused portions of service pits and pits not actually in use either covered or protected by guardrails or equivalent?",
"Are manhole covers, trench covers and similar covers, plus their supports, designed to carry a truck rear axle load of at least 20,000 pounds when located in roadways and subject to vehicle traffic?",
"Are floor or wall openings in fire resistive construction provided with doors or covers compatible with the fire rating of the structure and provided with self-closing feature when appropriate?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Food Service")
[
"Are floors free of grease, wet spots, debris?",
"Are slip-resistant shoes worn by employees?",
"Have wet floor signs been posted when necessary?",
"Have aisles been cleared and unobstructed?",
"Are knives kept sharp and safely stored?",
"Are proper lifting techniques being used?",
"Are lights and ventilation adequate?",
"Is all machinery equipped with proper guards?",
"Have waste receptacles been emptied before overflowing?",
"Are all exhaust filters clean?",
"Is there a good working ladder available for reaching upper shelves?",
"Is there material handling equipment available?",
"Are heavy objects stored properly on lower shelves?",
"Is there an emergency door release or ax available in freezer?",
"Are electrical appliances in good working order and properly guarded?",
"Have exits been adequately marked and kept clear?",
"Are fire extinguishers  charged and accessible?",
"Are only authorized personnel  using slicer and other power equipment?",
"Is there a complete first aid kit accessible?",
"Has an emergency treatment telephone number been posted?",
"Have all employees been trained in their current position?",
"Are safety signs and posters being used?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Fork Lifts")
[
"Are only trained personnel allowed to operate industrial trucks?",
"Is substantial overhead protective equipment provided on high lift rider equipment?",
"Are the required lift truck operating rules posted and enforced?",
"Is directional lighting provided on each industrial truck that operates in an area with less than 2 foot candles per square foot of general lighting?",
"Does each industrial truck have a warning horn, whistle, gong or other device which can be clearly heard above the normal noise in the areas where operated?",
"Are the brakes on each industrial truck capable of bringing the vehicle to a complete and safe stop when fully loaded?",
"Will the industrial truck's parking brake effectively prevent the vehicle from moving when unattended?",
"Are industrial trucks operating in areas where flammable gases or vapors, or combustible dust or ignitable fibers may be present in the atmosphere, approved for such locations?",
"Are motorized hand and hand/rider trucks so designed that the brakes are applied, and power to the drive motor shuts off when the operator releases his/her grip on the device that controls the travel?",
"Are industrial trucks with internal combustion engine operated in buildings or enclosed areas, carefully checked to ensure such operations do not cause harmful concentration of dangerous gases or fumes?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Fueling")
[
"Is it prohibited to fuel an internal combustion engine with a flammable liquid while the engine is running?",
"Are fueling operations done in such a manner that likelihood of spillage will be minimal?",
"When spillage occurs during fueling operations, is the spilled fuel cleaned up completely, evaporated, or other measures taken to control vapors before restarting the engine?",
"Are fuel tank caps replaced and secured before starting the engine?",
"In fueling operations is there always metal contact between the container and fuel tank?",
"Are fueling hoses of a type designed to handle the specific type of fuel?",
"Is it prohibited to handle or transfer gasoline in open containers?",
"Are open lights, open flames, or sparking or arcing equipment prohibited near fueling or transfer of fuel operations?",
"Is smoking prohibited in the vicinity of fueling operations?",
"Are fueling operations prohibited in building or other enclosed areas that are not specifically ventilated for this purpose?",
"Where fueling or transfer of fuel is done through a gravity flow system, are the nozzles of the self-closing type?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "General")
[
"Are all worksites clean and orderly?",
"Are work surfaces kept dry or appropriate means taken to assure the surfaces are slip-resistant?",
"Are all spilled materials or liquids cleaned up immediately?",
"Is combustible scrap, debris and waste stored safely and removed from the worksite promptly?",
"Is accumulated combustible dust routinely removed from elevated surfaces, including the overhead structure of buildings?",
"Is combustible dust cleaned up with a vacuum system to prevent the dust going into suspension?",
"Is metallic or conductive dust prevented from entering or accumulation on or around electrical enclosures or equipment?",
"Are covered metal waste cans used for oily and paint-soaked waste?",
"Are all oil and gas fired devices equipped with flame failure controls that will prevent flow of fuel if pilots or main burners are not working?",
"Are paint spray booths, dip tanks and the like cleaned regularly?",
"Are the minimum number of toilets and washing facilities provided?",
"Are all toilets and washing facilities clean and sanitary?",
"Are all work areas adequately illuminated?",
"Are pits and floor openings covered or otherwise guarded?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Grinders")
[
"Is the work rest used and kept adjusted to within 1/8 inch of the wheel?",
"Is the adjustable tongue on the top side of the grinder used and kept adjusted to within 1/4 inch of the wheel?",
"Do side guards cover the spindle, nut, and flange and 75 percent of the wheel diameter?",
"Are bench and pedestal grinders permanently mounted?",
"Are goggles or face shields always worn when grinding?",
"Is the maximum RPM rating of each abrasive wheel compatible with the RPM rating of the grinder motor?",
"Are fixed or permanently mounted grinders connected to their electrical supply system with metallic conduit or other permanent wiring method?",
"Does each grinder have an individual on and off control switch?",
"Is each electrically operated grinder effectively grounded?",
"Before new abrasive wheels are mounted, are they visually inspected and ring tested?",
"Are dust collectors and powered exhausts provided on grinders used in operations that produce large amounts of dust?",
"Are splashguards mounted on grinders that use coolant, to prevent the coolant reaching employees?",
"Is cleanliness maintained around grinder?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Hand Tools")
[
"Are all tools and equipment (both, company and employee-owned) used by employees at their workplace in good condition?",
"Are hand tools such as chisels, punches, which develop mushroomed heads during use, reconditioned or replaced as necessary?",
"Are broken or fractured handles on hammers, axes and similar equipment replaced promptly?",
"Are worn or bent wrenches replaced regularly?",
"Are appropriate handles used on files and similar tools?",
"Are employees made aware of the hazards caused by faulty or improperly used hand tools?",
"Are appropriate safety glasses, face shields, and similar equipment used while using hand tools or equipment that might produce flying materials or be subject to breakage?",
"Are jacks checked periodically to assure they are in good operating condition?",
"Are tool handles wedged tightly in the head of all tools?",
"Are tool cutting edges kept sharp so the tool will move smoothly without binding or skipping?",
"Are tools stored in dry, secure location where they won't be tampered with?",
"Is eye and face protection used when driving hardened or tempered spuds or nails?",
"Are grinders, saws, and similar equipment provided with appropriate safety guards?",
"Are power tools used with the correct shield, guard or attachment recommended by the manufacturer?",
"Are portable circular saws equipped with guards above and below the base shoe?" ,
"Are circular saw guards checked to assure they are not wedged up, thus leaving the lower portion of the blade unguarded?",
"Are rotating or moving parts of equipment guarded to prevent physical contact?",
"Are all cord-connected, electrically operated tools and equipment effectively grounded or of the approved double insulated type?",
"Are effective guards in place over belts, pulleys, chains, and sprockets, on equipment such as concrete mixers, air compressors, and the like?",
"Are portable fans provided with full guards or screens having openings 1/2 inch or less?",
"Is hoisting equipment available and used for lifting heavy objects, and are hoist ratings and characteristics appropriate for the task?",
"Are ground-fault circuit interrupters provided on all temporary electrical 15 and 20 ampere circuits, used during periods of construction?",
"Are pneumatic and hydraulic hoses on power-operated tools checked regularly for deterioration or damage?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Hazardous Chemical Exposures")
[
"Are employees trained in the safe handling practices of hazardous chemicals such as acids, caustics, and the like?",
"Are employees aware of the potential hazards involving various chemicals stored or used in the workplace such as acids, bases, caustics, epoxies, and phenols?",
"Is employee exposure to chemicals kept within acceptable levels?",
"Are eye wash fountains and safety showers provided in areas where corrosive chemicals are handled?",
"Are all containers, such as vats and storage tanks labeled as to their contents--e.g. CAUSTICS?",
"Are all employees required to use personal protective clothing and equipment when handling chemicals (i.e. gloves, eye protection, and respirators)?",
"Are flammable or toxic chemicals kept in closed containers when not in use?",
"Are chemical piping systems clearly marked as to their content?",
"Where corrosive liquids are frequently handled in open containers or drawn from storage vessels or pipelines, is adequate means readily available for neutralizing or disposing of spills or overflows properly and safely?",
"Have standard operating procedures been established and are they being followed when cleaning up chemical spills?",
"Where needed for emergency use, are respirators stored in a convenient, clean and sanitary location?",
"Are respirators intended for emergency use adequate for the various uses for which they may be needed?",
"Are employees prohibited from eating in areas where hazardous chemicals are present?",
"Is personal protective equipment provided, used and maintained whenever necessary?",
"Are there written standard operating procedures for the selection and use of respirators where needed?",
"If you have a respirator protection program, are your employees instructed on the correct usage and limitations of the respirators?",
"Are the respirators NIOSH approved for this particular application?",
"Are they regularly inspected and cleaned sanitized and maintained?",
"If hazardous substances are used in your processes, do you have a medical or biological monitoring system in operation?",
"Are you familiar with the Threshold Limit Values or Permissible Exposure Limits of airborne contaminants and physical agents used in your workplace?",
"Have control procedures been instituted for hazardous materials, where appropriate, such as respirators, ventilation systems, handling practices, and the like?",
"Whenever possible, are hazardous substances handled in properly designed and exhausted booths or similar locations?",
"Do you use general dilution or local exhaust ventilation systems to control dusts, vapors, gases, fumes, smoke, solvents or mists which may be generated in your workplace?",
"Is ventilation equipment provided for removal of contaminants from such operations as production grinding, buffing, spray painting, and/or vapor decreasing, and is it operating properly?",
"Do employees complain about dizziness, headaches, nausea, irritation, or other factors of discomfort when they use solvents or other chemicals?",
"Is there a dermatitis problem--do employees complain about skin dryness, irritation, or sensitization?",
"Have you considered the use of an industrial hygienist or environmental health specialist to evaluate your operation?",
"If internal combustion engines are used, is carbon monoxide kept within acceptable levels?",
"Is vacuuming used, rather than blowing or sweeping dusts whenever possible for clean up?",
"Are materials, which give off toxic asphyxiant, suffocating or anesthetic fumes, stored in remote or isolated locations when not in use?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Hazardous Substances Communication")
[
"Is there a list of hazardous substances used in your workplace?",
"Is there a written hazard communication program dealing with Material Safety Data Sheets (MSDS) labeling, and employee training?","Who is responsible for MSDS sheets, container labeling, employee training?",
"Is each container for a hazardous substance (i.e. vats, bottles, storage tanks,) labeled with product identity and a hazard warning (communication of the specific health hazards and physical hazards)?",
"Is there a Material Safety Data Sheet readily available for each hazardous substance used?",
"How will you inform other employers whose employees share the same work area where the hazardous substances are used?",
"Is there an employee training program for hazardous substances?",
"Does the program include an explanation of what an MSDS is and how to use and obtain one?",
"MSDS contents for each hazardous substance or class of substances?",
"Does the program include an Explanation of Right to Know?",
"Does the program Identify where employees can see the employer's written hazard communication program and where hazardous substances are present in their work area?",
"Does the program list the physical and health hazards of substances in the work area, how to detect their presence, and specific protective measures to be used?",
"Does the program detail the hazard communication program, including how to use the labeling system and MSDSs?",
"Does the program state how employees will be informed of hazards of non-routine tasks, and hazards of unlabeled pipes?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Hoisting Equipment")
[
"Is each overhead electric hoist equipped with a limit device to stop the hook travel at its highest and lowest point of safe travel?",
"Will each hoist automatically stop and hold any load up to 125 percent of its rated load, if its actuating force is removed?",
"Is the rated load of each hoist legibly marked and visible to the operator?",
"Are stops provided at the safe limits of travel for trolley hoist?",
"Are the controls of hoists plainly marked to indicate the direction of travel or motion?",
"Is each cage-controlled hoist equipped with an effective warning device?",
"Are close-fitting guards or other suitable devices installed on hoist to assure hoist ropes will be maintained in the sheave groves?",
"Are all hoist chains or ropes of sufficient length to handle the full range of movement for the application while still maintaining two full wraps on the drum at all times?",
"Are nip points or contact points between hoist ropes and sheaves which are permanently located within 7 feet of the floor, ground or working platform, guarded?",
"Is it prohibited to use chains or rope slings that are kinked or twisted?",
"Is it prohibited to use the hoist rope or chain wrapped around the load as a substitute, for a sling?",
"Is the operator instructed to avoid carrying loads over people?",
"Are only employees who have been trained in the proper use of hoists allowed to operate them?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Housekeeping")
[
"Is proper ventilation and illumination adequate in all areas?",
"Are aisles and passageways clear and unobstructed?",
"Are temporarily obstructed passageways clearly identified and barricaded?",
"Are all spillages and breakages immediately cleaned up?",
"Are electric cords and phone cables secured to prevent tripping hazards?",
"Are floors in good condition and made slip resistant where necessary?",
"Is storage and equipment rooms clean and orderly?",
"Are stairways equipped with standard handrails?",
"Are employees provided proper instruction on use of equipment, tools and machinery?",
"Is protective equipment, devices, and clothing used as required?",
"Are electric tools and machinery properly grounded?",
"Are all waste materials deposited in proper containers?",
"Are waste receptacles emptied before overflowing?",
"Are only authorized personnel allowed to enter designated areas?",
"Are fire extinguishers of proper size and type for each location properly charged?",
"Are instruction given on what to do in case of fires or other emergencies?",
"Is 'No Smoking' rule enforced in restricted areas?",
"Are fire escapes and exits adequately marked and kept clear?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Infection Control")
[
"Are employees potentially exposed to infectious agents in body fluids?",
"Have occasions of potential occupational exposure been identified and documented?",
"Has a training and information program been provided for employees exposed to or potentially exposed to blood and/or body fluids?",
"Have infection control procedures been instituted where appropriate, such as ventilation, universal precautions, workplace practices, and personal protective equipment?",
"Are employees aware of specific workplace practices to follow when appropriate? (Hand washing, handling sharp instruments, handling of laundry, disposal of contaminated materials, reusable equipment.)",
"Is personal protective equipment provided to employees, and in all appropriate locations?",
"Is the necessary equipment (i.e. mouthpieces, resuscitation bags, and other ventilation devices) provided for administering mouth-to-mouth resuscitation on potentially infected patients?",
"Are facilities/equipment to comply with workplace practices available, such as hand-washing sinks, biohazard tags and labels, needle containers, detergents/disinfectants to clean up spills?",
"Are all equipment and environmental and working surfaces cleaned and disinfected after contact with blood or potentially infectious materials?",
"Is infectious waste placed in closable, leak proof containers, bags or puncture-resistant holders with proper labels?",
"Has medical surveillance including HBV evaluation, antibody testing and vaccination been made available to potentially exposed employees?",
"Does the company provide training on universal precautions?",
"Has training occurred on personal protective equipment?",
"Has training occurred on workplace practices, which should include blood drawing, room cleaning, laundry handling, clean up of blood spills?",
"Has training occurred on needlestick exposure/management?",
"Have people been vaccinated for Hepatitis B?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Jackhammering")
[
"Are employees wearing proper PPE: eye protection, steel-toed boots, hearing protection; and safety gloves?",
"Are workers rotating, whenever possible, when jackhammering for extended periods of time?",
"Is the compressor placed as far as possible from the work area to reduce the level of noise?" ,
"Has the jackhammer and associated equipment inspected for defect or damage?",
"Has the air hoses been checked for breaks, cracks, and worn or damaged couplings?",
"Is the rating of the hose sufficient for the job intended?",
"Has the electrical cord been inspected for frays, wear and other signs of damage?",
"Have the hose ends been secured to prevent whipping if an accidental cut or break occurs?",
"Do workers sling the electrical cord on their shoulder to prevent its accidental swerving which can cause electrocution?",
"Has the proper point for the material to be broken being used? Remember to use rock point for rock, spade point for asphalt, and chisel point for concrete. Never use a broken or cracked point!",
"Is the tool being operated at a slight angle with it leaning back prevent the point from getting stuck in the material and the tool from getting out of control?",
"Is water being used for suppression and/or respiratory equipment to limit exposure levels?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Ladders")
[
"Are all ladders maintained in good condition, joints between steps and side rails tight, all hardware and fittings securely attached, and moveable parts operating freely without binding or undue play?",
"Are non-slip safety feet provided on each ladder?",
"Are non-slip safety feet provided on each metal or rung ladder?",
"Are ladder rungs and steps free of grease and oil?",
"Is it prohibited to place a ladder in front of doors opening toward the ladder except when the door is blocked open, locked or guarded?",
"Is it prohibited to place ladders on boxes, barrels, or other unstable bases to obtain additional height?",
"Are employees instructed to face the ladder when ascending or descending?",
"Are employees prohibited from using ladders that are broken, missing steps, rungs, or cleats, broken side rails or other faulty equipment?",
"Are employees instructed not to use the top 2 steps of ordinary stepladders as a step?",
"When portable rung ladders are used to gain access to elevated platforms, roofs, and the like does the ladder always extend at least 3 feet above the elevated surface?",
"Is it required that when portable rung or cleat type ladders are used the base is so placed that slipping will not occur, or it is lashed or otherwise held in place?",
"Are portable metal ladders legibly marked with signs reading 'CAUTION' 'Do Not Use Around Electrical Equipment' or equivalent wording?",
"Are employees prohibited from using ladders as guys, braces, skids, gin poles, or for other than their intended purposes?",
"Are employees instructed to only adjust extension ladders while standing at a base (not while standing on the ladder or from a position above the ladder)?",
"Are metal ladders inspected for damage?",
"Are the rungs of ladders uniformly spaced at 12 inches, center to center?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Lockout/Tagout")
[
"Is all machinery or equipment capable of movement, required to be de-energized or disengaged and blocked or locked out during cleaning, servicing, adjusting or setting up operations, whenever required?",
"Is the locking-out of control circuits in lieu of locking-out main power disconnects prohibited?",
"Are all equipment control valve handles provided with a means for locking-out?",
"Does the lockout procedure require that stored energy (i.e. mechanical, hydraulic, air,) be released or blocked before equipment is locked-out for repairs?",
"Are appropriate employees provided with individually keyed personal safety locks?",
"Are employees required to keep personal control of their key(s) while they have safety locks in use?",
"Is it required that employees check the safety of the lock out by attempting a start up after making sure no one is exposed?",
"Where the power disconnecting means for equipment does not also disconnect the electrical control circuit?",
"Are the appropriate electrical enclosures identified?",
"Are means provided to assure the control circuit can also be disconnected and locked out?",
"Are only approved apparatus (torches, regulators, pressure-reducing valves, acetylene generators, manifolds) used?",
"Are cylinders kept away from sources of heat?",
"Is it prohibited to use cylinders as rollers or supports?",
"Are empty cylinders appropriately marked their valves closed and valve-protection caps on?",
"Are signs reading: DANGER NO-SMOKING, MATCHES, OR OPEN LIGHTS, or the equivalent posted?",
"Are cylinders, cylinder valves, couplings, regulators, hoses, and apparatus keep free of oily or greasy substances?",
"Is care taken not to drop or strike cylinders?",
"Unless secured on special trucks, are regulators removed and valve-protection caps put in place before moving cylinders?",
"Do cylinders without fixed hand wheels have keys, handles, or non-adjustable wrenches on stem valves when in service?",
"Are liquefied gases stored and shipped valve-end up with valve covers in place?",
"Are employees instructed to never crack a fuel-gas cylinder valve near sources of ignition?",
"Before a regulator is removed, is the valve closed and gas released form the regulator?",
"Is red used to identify the acetylene (and other fuel-gas) hose, green for oxygen hose, and black for inert gas and air hose?",
"Are pressure-reducing regulators used only for the gas and pressures for which they are intended?",
"Is open circuit (No Load) voltage of arc welding and cutting machines as low as possible and not in excess of the recommended limits?",
"Under wet conditions, are automatic controls for reducing no-load voltage used?",
"Is grounding of the machine frame and safety ground connections of portable machines checked periodically?",
"Are electrodes removed from the holders when not in use?",
"Is it required that electric power to the welder be shut off when no one is in attendance?",
"Is suitable fire extinguishing equipment available for immediate use?",
"Is the welder forbidden to coil or loop welding electrode cable around his body?",
"Are wet machines thoroughly dried and tested before being used?",
"Are work and electrode lead cables frequently inspected for wear and damage, and replaced when needed?",
"Do means for connecting cables' lengths have adequate insulation?",
"When the object to be welded cannot be moved and fire hazards cannot be removed, are shields used to confine heat, sparks, and slag?",
"Are firewatchers assigned when welding or cutting is performed, in locations where a serious fire might develop?",
"Are combustible floors kept wet, covered by damp sand, or protected by fire-resistant shields?",
"When floors are wet down, are personnel protected from possible electrical shock?",
"When welding is done on metal walls, are precautions taken to protect combustibles on the other side?",
"Before hot work is begun, are used drums, barrels, tanks, and other containers so thoroughly cleaned that no substances remain that could explode, ignite, or produce toxic vapors?",
"Is it required that eye protection helmets, hand shields and goggles meet appropriate standards?",
"Are employees exposed to the hazards created by welding, cutting, or bracing operations protected with personal protective equipment and clothing?",
"Is a check made for adequate ventilation in and where welding or cutting is preformed?",
"When working in confined places are environmental monitoring tests taken and means provided for quick removal of welders in case of an emergency?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Machine Guarding")
[
"Is there a training program to instruct employees on safe methods of machine operation?",
"Is there adequate supervision to ensure that employees are following safe machine operating procedures?",
"Is there a regular program of safety inspection of machinery and equipment?",
"Is all machinery and equipment kept clean and properly maintained?",
"Is sufficient clearance provided around and between machines to allow for safe operations, set up and servicing, material handling and waste removal?",
"Is equipment and machinery securely placed and anchored when necessary to prevent tipping or other movement that could result in personal injury?",
"Is there a power shut-off switch within reach of the operator's position at each machine?",
"Can electric power to each machine be locked out for maintenance, repair, or security?",
"Are the noncurrent-carrying metal parts of electrically operated machines bonded and grounded?",
"Are foot-operated switches guarded or arranged to prevent accidental actuation by personnel or falling",
"Are manually operated valves and switches controlling the operation of equipment and machines clearly identified and readily accessible?",
"Are all emergency stop buttons colored red?",
"Are all pulleys and belts that are within 7 feet of the floor or working level properly guarded?",
"Are all moving chains and gears properly guarded?",
"Are splashguards mounted on machines that use coolant, to prevent the coolant from reaching employees?",
"Are methods provided to protect the operator and other employees in the machine area from hazards created at the point of operation, ingoing nip points, rotating parts, flying chips, and sparks?",
"Are machinery guards secure and so arranged that they do not offer a hazard in their use?",
"If special hand tools are used for placing and removing material, do they protect the operator's hands?",
"Are revolving drums, barrels, and containers required to be guarded by an enclosure that is interlocked with the drive mechanism, so that revolution cannot occur unless the guard enclosure is in place, so guarded?",
"Do arbors and mandrels have firm and secure bearings and are they free from play?",
"Are provisions made to prevent machines from automatically starting when power is restored after a power failure or shutdown?",
"Are machines constructed so as to be free from excessive vibration when the largest size tool is mounted and run at full speed?",
"If machinery is cleaned with compressed air, is air pressure controlled and personal protective equipment or other safeguards used to protect operators and other workers from eye and body injury?",
"Are fan blades protected with a guard having openings no larger than 1/2 inch, when operating within 7 feet of the floor?",
"Are saws used for ripping, equipped with anti-kick back devices and spreaders?",
"Are radial arm saws so arranged that the cutting head will gently return to the back of the table when released?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Machine Shop")
[
"Are ladders in good condition, equipped with safety treads and are metal ladders marked properly?",
"Are all electric and gasoline powered equipment in good repair?",
"Has all machinery and electrical equipment been on regular maintenance schedule?",
"Has all electrical equipment and extension cords been properly grounded?",
"Are hand tools in good condition and properly stored?",
"Is flammable liquids stored in approved containers?",
"Are fire extinguishers available of correct type for each location?",
"Is protective equipment, devices, clothing used as required?",
"Are shop areas clean and orderly?",
"Are lockouts on electrical equipment used when making repairs?",
"Are safety lines used when washing windows above first floor?",
"Are gas cylinders properly stored away from sources of heat?",
"Are safety precautions taken when replacing burned out light bulbs and tubes?",
"Are exhaust systems free of grease and lint?",
"Are filters and ducts cleaned on regular basis?",
"Are fire alarms tested frequently?",
"Are fire escapes and exits kept clear and adequately marked?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Manufacturing (Maintenance)")
[
"Is the welding area ventilation hood working properly during welding operations?",
"Are grinding wheels equipped with properly adjusted safety shields and tool rests?",
"Do employees wear welding hoods and erect protective shields during welding?",
"Are machines turned off and locked out during maintenance, unless specifically approved and directed by the maintenance supervisor?",
"Are only qualified employees   designated by the maintenance supervisor are permitted to work on energized circuits?",
"Is welding done under the ventilation hood?",
"Are parts being welded clean and dry?",
"Are employees told not to climb to heights where falls are possible without use of approved ladders and safety belts?",
"Do employees exercise care in lifting, torquing, and similar strenuous work consistent with training (e.g., back injury prevention training)?",
"Do employees wear chemical protective gloves when degreasing parts?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Manufacturing (Material Handling)")
[
"Are proper lifting techniques consistent with training (e.g., back injury prevention training) being used?",
"Are multiple caseloads placed on pallets and only moved with a pallet lift? or by a forklift?",
"Are employees operating mechanical handling equipment qualified by training and authorized by the area supervisor to do so?",
"Do employees not lift any more than one case at a time?",
"Are employees not allowed to ride forklift forks to pick orders?",
"Do employees wear safety shoes?",
"Are forklifts used to lower pallets to floor level to pick single cases?",
"Are parts cases stacked to no more than four (4) cases on a pallet and no than three (3) pallets high?",
"Are floors kept clean, dry, and oil free?"
].each do |question_name|
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Manufacturing (Operators)")
[
"Are designated employees trained to respond to a fire or other emergencies?",
"Are 'No horseplay' or use of intoxicating substances being done on the premises?",
"Are their a strict policy of no smoking allowed in the manufacturing area?",
"Are lines turned off and locked out prior to cleaning or worn tool replacement?" ,
"Are safety guards and shields in place when machines are operating?",
"Do operators verify at the beginning and end of the shift that the ventilation system is working properly?","
Do operators notify maintenance immediately if the ventilation system is not working properly and the cutting oil is not properly draining from machines?",
"Are machines not operated with damaged or worn cutting tools?",
"Are floor surfaces in work area kept clean and dry?",
"Is their a policy of no food or drinks allowed in the vicinity of the machines?",
"Are safety glasses worn in the shop?",
"Are safety (steel-toed) shoes worn in the shop?",
"Are earplugs worn during machine cutting operation?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Material Handling")
[
"Is there safe clearance for equipment through aisles and doorways?",
"Are aisleways designated, permanently marked, and kept clear to allow unhindered passage?",
"Are motorized vehicles and mechanized equipment inspected daily or prior to use?",
"Are vehicles shut off and brakes set prior to loading or unloading?",
"Are containers or combustibles or flammables, when stacked while being moved, always separated by dunnage sufficient to provide stability?",
"Are dock boards (bridge plates) used when loading or unloading operations are taking place between vehicles and docks?",
"Are trucks and trailers secured from movement during loading and unloading operations?",
"Are dock plates and loading ramps constructed and maintained with sufficient strength to support imposed loading?",
"Are hand trucks maintained in safe operating condition?",
"Are chutes equipped with sideboards of sufficient height to prevent the materials being handled from falling off?",
"Are chutes and gravity roller sections firmly placed or secured to prevent displacement?",
"At the delivery end of rollers or chutes, are provisions made to brake the movement of the handled materials?",
"Are pallets usually inspected before being loaded or moved?",
"Are hooks with safety latches or other arrangements used when hoisting materials so that slings or load attachments won't accidentally slip off the hoist hooks?",
"Are securing chains, ropes, chockers or slings adequate for the job to be performed?",
"When hoisting material or equipment, are provisions made to assure no one will be passing under the suspended loads?",
"Are Material Safety Data Sheets available to employees handling hazardous substances?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Noise")
[
"Are there areas in the workplace where continuous noise levels exceed 85 dBA? (To determine maximum allowable levels for intermittent or impact noise, see OSHA Title 8, Section 5097.)",
"Are noise levels being measured using a sound level meter or an octave band analyzer and records being kept?",
"Has the company isolated noisy machinery from the rest of your operation?",
"Have engineering controls been used to reduce excessive noise levels?",
"Where engineering controls are determined not feasible, are administrative controls (i.e. worker rotation) being used to minimize individual employee exposure to noise?",
"Is there an ongoing preventive health program to educate employees in safe levels of noise and exposure, effects of noise on their health, and use of personal protection?",
"Is the training repeated annually for employees exposed to continuous noise above 85 dBA?",
"Have work areas where noise levels make voice communication between employees difficult been identified and posted?",
"Is approved hearing protective equipment (noise attenuating devices) available to every employee working in areas where continuous noise levels exceed 85 dBA?",
"If ear protectors are required, are employees properly fitted and instructed in their use and care?",
"Are employees exposed to continuous noise above 85 dBA, given periodic audiometric testing to ensure that there is an effective hearing protection system?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Painting-Glazing")
[
"Are ladders placed so that the side rails have secure footing.?",
"Is the topcap or the step below the topcap of stepladders not used as steps?",
"Are ladders not placed on boxes or other unstable bases to gain height?",
"Are the ladders always extended 3 feet above roof when climbing to the roof of a building?" ,
"Are ladders not placed in front of a door unless the door is guarded, locked or blocked?",
"Are ladders are not placed against a window?",
"Do employees know not to stand or work on the top 3 rungs of straight ladders?",
"Is the proper ladder being used for the job?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Piping")
[
"When nonpotable water is piped through a facility, are outlets or taps posted to alert employees that it is unsafe and not to be used for drinking, washing or other personal use?",
"When hazardous substances are transported through above ground piping, is each pipeline identified at points where confusion could introduce hazards to employees?",
"When pipelines are identified by color painting, are all visible parts of the line so identified?",
"When pipelines are identified by color painted bands or tapes, are the bands or tapes located at reasonable intervals and at each outlet, valve or connection?",
"When pipelines are identified by color, is the color code posted at all locations where confusion could introduce hazards to employees?",
"When the contents of pipelines are identified by name or name abbreviation, is the information readily visible on the pipe near each valve or outlet?",
"When pipelines carrying hazardous substances are identified by tags, are the tags constructed of durable materials, the message carried clearly and permanently distinguishable and are tags installed at each valve or outlet?",
"When pipelines are heated by electricity, steam or other external source, are suitable warning signs or tags placed at unions, valves, or other serviceable parts of the system?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Powder-Actuated Tools")
[
"Are employees who operate powder-actuated tools trained in their use and carry a valid operator's card?",
"Do the powder-actuated tools being used have written approval of the Division of Occupational Safety and Health?",
"Is each powder-actuated tool stored in its own locked container when not being used?",
"Is a sign at least 7\" by 10\" with bold type reading 'POWDER-ACTUATED TOOL IN USE' conspicuously posted when the tool is being used?",
"Are powder-actuated tools left unloaded until they are actually ready to be used?",
"Are powder-actuated tools inspected for obstructions or defects each day before use?",
"Do powder-actuated tools operators have and use appropriate personal protective equipment such as hard hats, safety goggles, safety shoes and ear protectors?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "PPE")
[
"Are protective goggles or face shields provided and worn where there is any danger of flying particles or corrosive materials?",
"Are approved safety glasses required to be worn at all times in areas where there is a risk of eye injuries such as punctures, abrasions, contusions or burns?",
"Are employees who need corrective lenses (glasses or contacts lenses) in working environments with harmful exposures, required to wear only approved safety glasses, protective goggles, or use other medically approved precautionary procedures?",
"Are protective gloves, aprons, shields, or other means provided against cuts, corrosive liquids and chemicals?",
"Are hard hats provided and worn where danger of falling objects exists?",
"Are hard hats inspected periodically for damage to the shell and suspension system?",
"Is appropriate foot protection required where there is the risk of foot injuries from hot, corrosive, poisonous substances, falling objects, crushing or penetrating actions?",
"Are approved respirators provided for regular or emergency use where needed?",
"Is all protective equipment maintained in a sanitary condition and ready for use?",
"Do you have eye wash facilities and a quick drench shower within the work area where employees are exposed to injurious corrosive materials?",
"Where special equipment is needed for electrical workers, is it available?",
"When lunches are eaten on the premises, are they eaten in areas where there is no exposure to toxic materials or other health hazards?",
"Is protection against the effects of occupational noise exposure provided when sound levels exceed those of the OSHA noise standard?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Recordkeeping")
[
"Are all occupational injury or illnesses, except minor injuries requiring only first aid, being recorded as required on the OSHA Form 300?",
"Are employee medical records and records of employee exposure to toxic substances or harmful physical agents up-to-date?",
"Have arrangements been made to maintain required records for the legal period of time for each specific type record?  (Some records must be maintained for at least 40 years.)",
"Are operating permits and records up-to-date for such items as elevators, air pressure tanks, and liquefied petroleum gas tanks, etc.?",
"Are carcinogen permits and records filed with OSHA as required?" ,
"Are employee safety and health training records maintained?",
"Is documentation of safety inspections and corrections maintained?",
"Are safety committee meeting records maintained?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Rolling Towers")
[
"Are outriggers (if required) properly installed on both sides of rolling towers?",
"Are platforms fully planked with no gaps greater than 1 inch?",
"Are wheel brakes operable, and have employees been instructed to set brakes while in use?",
"Are safety rails installed at the 10-foot level, or some other type of fall protection?",
"Have employees been properly instructed in the safety procedures for using rolling towers?",
"Have caster or wheel stems been pinned or otherwise secured to prevent them from coming separated from the scaffold legs?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Scaffold")
[
"Are sills properly placed and adequately sized?",
"Have screw jacks been used to level and plumb scaffold instead of unsafe objects such as concrete blocks?",
"Are base plates and/or screw jacks in firm contact with sills and frames?",
"Are all scaffold legs braced with braces properly attached?",
"Is guard railing in place on all open sides and ends above the 10’ level?",
"Have ladders been provided as a means of access to the scaffold?",
"Have freestanding towers been guyed or tied so as not to exceed the 4 to 1 base height ratio?",
"Are working level platforms fully planked between guardrails with no split planking used?",
"Does planking have minimum 12” overlap extended beyond supports and cleated at ends?",
"Are toe-boards installed properly?",
"Has a tie off analysis been performed?",
"Are safety harnesses available for use when needed?",
"Have all employees working on scaffold been informed of and trained in safe working practices while working on the scaffold?",
"Are out riggers properly installed at 90-degree angles perpendicular to the building?",
"Have scaffold components been properly inspected for damage and compatibility?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Sanitizing Equipment and Clothing")
[
"Is personal protective clothing or equipment, that employees are required to wear or use, of a type capable of being easily cleaned and disinfected?",
"Are employees prohibited from interchanging personal protective clothing or equipment, unless it has been properly cleaned?",
"Are machines and equipment, which processes, handle or apply materials that could be injurious to employees, cleaned and/or decontaminated before being overhauled or placed in storage?",
"Are employees prohibited from smoking or eating in any area where contaminates are present that could be injurious if ingested?",
"When employees are required to change from street clothing into protective clothing, is a clean changeroom with separate storage facility for street and protective clothing provided?",
"Are employees required to shower and wash their hair as soon as possible after a known contact has occurred with a carcinogen?",
"When equipment, materials, or other items are taken into or removed from a carcinogen regulated area, is it done in a manner that will not contaminate non-regulated areas or the external environment?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Spraying Operations")
[
"Is adequate ventilation assured before spray operations are started?",
"Is mechanical ventilation provided when spraying operations are done in enclosed areas?",
"When mechanical ventilation is provided during spraying operations, is it so arranged that it will not circulate the contaminated air?",
"Is the spray area free of hot surfaces?",
"Is the spray area at least 20 feet from flames, sparks, operating electrical motors and other ignition sources?",
"Are portable lamps used to illuminate spray areas suitable for use in a hazardous location?",
"Is approved respiratory equipment provided and used when appropriate during spraying operations?",
"Are all solvents used for cleaning have a flash point of 100F or less?",
"Are fire control sprinkler heads kept clean?",
"Are NO SMOKING signs posted in spray areas, paint rooms, paint booths, and paint storage areas?",
"Is the spray area kept clean of combustible residue?",
"Are spray booths constructed of metal, masonry, or other substantial noncombustible material?",
"Are spray booth floors and baffles noncombustible and easily cleaned?",
"Is infrared drying apparatus kept out of the spray area during spraying operations?",
"Is the spray booth completely ventilated before using the drying apparatus?",
"Is the electric drying apparatus properly grounded?",
"Are lighting fixtures for spray booths located outside of the booth and the interior lighted through sealed clear panels?",
"Are the electric motors for exhaust fans placed outside booths or ducts?",
"Are belts and pulleys inside the booth fully enclosed?",
"Do ducts have access doors to allow cleaning?",
"Do all drying spaces have adequate ventilation?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Stairways")
[
"Are standard stair rails or handrails on all stairways having four or more risers?",
"Are all stairways at least 22 inches wide?",
"Do stairs have at least a 6'6\" overhead clearance?",
"Do stairs angle no more than 50 and no less than 30 degrees?",
"Are stairs of hollow-pan type treads and landings filled to nosing level with solid material?",
"Are step risers on stairs uniform from top to bottom, with no riser spacing greater than 7-1/2 inches?",
"Are steps on stairs and stairways designed or provided with a surface that renders them slip resistant?",
"Are stairway handrails located between 30 and 34 inches above the leading edge of stair treads?",
"Do stairway handrails have a least 1-1/2 inches of clearance between the handrails and the wall or surface they are mounted on?",
"Are stairway handrails capable of withstanding a load of 200 pounds, applied in any direction?",
"Where stairs or stairways exit directly into any area where vehicles may be operated, are adequate barriers and warnings provided to prevent employees stepping into the path of traffic?",
"Do stairway landings have a dimension measured in the direction of travel, at least equal to width of the stairway?",
"Is the vertical distance between stairway landings limited to 12 feet or less?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Steel")
[
"Has shop detailer provided a marking plan?",
"Has structural design engineer reviewed and approved drawings?",
"Has erection engineer provided a certified sequential erection procedure which is understood and agreed?",
"Are all holding-down bolts, cast-in concrete footing and pedestals or slabs within tolerance?",
"Have weather conditions been monitored for potentially dangereous storms and a contingency plan been activated?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Tire Inflation")
[
"Where tires are mounted and/or inflated on drop center wheels is a safe practice procedure posted and enforced?",
"Where tires are mounted and/or inflated on wheels with split rims and/or retainer rings is a safe practice procedure posted and enforced?",
"Does each tire inflation hose have a clip-on chuck with at least 24 inches of hose between the chuck and an in- line hand valve and gauge?",
"Does the tire inflation control valve automatically shut off the airflow when the valve is released?",
"Is a tire restraining device such as a cage, rack or other effective means used while inflating tires mounted on split rims, or rims using retainer rings?",
"Are employees strictly forbidden from taking a position directly over or in front of a tire while it's being inflated?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Traffic Control")
[
"Has the work area been evaluated for hazards?",
"Has the emergency vehicle been positioned properly?",
"Are safety vests being worn?",
"Have advanced warning signs been placed?",
"Are traffic cones placed for proper taper length?",
"Are traffic cones placed along work area (max of 40’ intervals)?",
"Are emergency warning lights reduced?",
"Has law enforcement been notified?",
"Has the staging area been established?",
"Has a buffer space been established?",
"Are flaggers with equipment positioned properly?",
"Are emergency air siren cans available?",
"Are portable radios being used?",
"Have steps been taken to make sure that the cones will not be blown over or displaced by wind or moving traffic, with ballast kept to minimum needed?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Train Crossings")
[
"Is the level of protection (eg Give Way Signs, Stop Signs, Flashing Lights, Boom Barriers) in accordance with guidelines?",
"Are required sight distances likely to be restricted by future vegetation growth?",
"Is it possible for sight distances to be obstructed by temporary events such as parked wagons and vehicles, stockpiles, etc?",
"Has the railway operator been contacted to check for any changes or seasonal variation in train activity? Is the railway still in use?",
"Has the railway operator/s been contacted to determine whether any special operational conditions apply to the train (eg sound horn, display headlights, reduce speed, flagperson control, etc)?",
"Is there adequate provision for emergency vehicle access to the crossing?",
"Are all locations free of construction or maintenance equipment, and any signing or temporary traffic control devices that are no longer required?",
"Is sight distance to other vehicles adequate for the speed of traffic approaching the crossing?",
"Is adequate sight distance provided for intersections, driveways, pedestrian crossings etc?",
"Does the road superelevation conflict with the rail profile, or vice versa?",
"Have disused signs, pavement markings or signalling equipment been removed properly?",
"Do streetlight and tree lines conform with the road and/or rail alignment?",
"Are all traffic lane and carriageway widths, adequate?",
"Are shoulder or verge widths appropriate (eg for broken down or emergency vehicles)?",
"Is the crossing located safely with respect to horizontal and vertical alignment?",
"Where the crossing is located near the end of high speed road sections (eg on the terminating approach to a T-junction), are there traffic control devices to alert drivers?",
"Do signs and/or pavement markings conform with actual vehicle movements at the crossing satisfactorily?",
"Are turning radii and tapers at nearby intersections and driveways appropriate?",
"Are adequate approach and departure stacking distances available for long vehicles?",
"Do pedestrian mazes, fences or other structures restrict visibility from side roads or driveways?",
"If provided, can vehicles safely enter and leave nearby railway maintenance tracks?",
"Are there appropriate travel paths and crossing points for pedestrians, cyclists and the disabled (wheel chairs/‘gophers’)?",
"Where necessary, are pedestrian maze treatments and/or gates installed for pedestrians and cyclists?",
"Is associated signing and/or warning lights and audible warning devices installed?",
"Is fencing installed to guide pedestrian movements and is fencing of appropriate design (eg avoids solid horizontal rails)?",
"Where necessary, are crash barriers installed to protect pedestrian and cyclist flows?",
"Are rail tracks flush with the road and/or path surface to avoid tripping by pedestrians and dislodgment of cyclists?",
"Are there adequate provisions for the elderly, the disabled, children, wheelchairs and baby carriages (eg holding rails, kerb and median crossings, ramps)?",
"Where necessary, are hand rails provided and are they adequate?",
"Is the pavement width adequate for the number of cyclists using the crossing?",
"Are bicycle safe grates provided at drainage pits where necessary?",
"Is appropriate lighting installed?",
"Are the appropriate types of poles used for all locations and correctly installed (eg slip-base at correct height, rigid poles protected if within clear zone)?",
"Are traffic signs in their correct locations, and properly positioned with respect to lateral clearance and height?",
"Are signs placed so as not to restrict sight distance, particularly for turning vehicles?",
"Are all signs effective for all likely conditions (eg day, night, rain, fog, rising or setting sun, oncoming headlights, poor lighting)?",
"Do sign supports conform to guidelines?",
"Where applicable, are overhead electric warning signs installed?",
"Is all necessary pavement marking installed?",
"Are pavement markings (centre lines, edge lines, transverse lines, cross hatching) clearly visible and effective for all likely conditions (eg day, night, rain, fog, rising or setting sun, oncoming headlights, light coloured pavement surface, poor lighting)?",
"Particularly at skewed crossings, does longitudinal pavement marking provide adequate guidance through the crossing?",
"Have delineation devices (eg width markers, RAILWAY CROSSING boards, guide posts, chevron alignment markers, etc) been installed where required? Are they correctly placed?",
"Is delineation effective for all likely conditions (eg day, night, rain, fog, rising or setting sun, oncoming headlights)?","Can dust from unsealed surfaces adversely effect delineation?",
"On truck routes, are reflective devices appropriate to driver's eye height?",
"Are signals, boom barriers and bells operating correctly? Are pre-warning times and sequences prior to the arrival of the train in accordance with appropriate codes of practice?",
"Is the number and location of signal displays appropriate?",
"Where appropriate, are the railway crossing signals coordinated with nearby traffic control signals? Are the delays to vehicles due to train activity excessive, (ie > 50% of cycle time)?",
"Where appropriate, are the railway crossing signals coordinated with the train signalling system?",
"Have any visibility problems caused by the rising or setting sun been addressed (eg target boards)?",
"Are signal displays focused and aligned so that they can be seen only by the motorists for whom they are intended?",
"Where signal displays are not visible from an adequate distance, are supplementary signals or advance yellow flashing warning signs installed?",
"Is the pavement free of defects (eg excessive roughness or rutting, corrugations, potholes etc) which could result in safety problems (eg loss of steering control)?",
"Does the pavement appear to have adequate skid resistance?",
"Is the pavement free of areas where ponding or sheet flow of water may occur, with resultant safety problems?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Transporting")
[
"Do employees who operate vehicles on public thoroughfares have valid operator's licenses?",
"When seven or more employees are regularly transported in a van, bus or truck, is the operator's license appropriate for the class of vehicle being driven?",
"Is each van, bus or truck used regularly to transport employees, equipped with an adequate number of seats?",
"When employees are transported by truck, are provisions provided to prevent them from falling from the vehicle?",
"Are vehicles used to transport employees, equipped with lamps, brakes, horns, mirrors, windshields and turn signals in good repair?",
"Are transport vehicles provided with handrails, steps, stirrups or similar devices, so placed and arranged that employees can safely mount or dismount?",
"Are employee transport vehicles equipped at all times with at least two reflective type flares?",
"Is a full charged fire extinguisher, in good condition, with at least 4 B:C rating maintained in each employee transport vehicle?",
"When cutting tools with sharp edges are carried in passenger compartments of employee transport vehicles, are they placed in closed boxes or containers which are secured in place?",
"Are employees prohibited from riding on top of any load, which can shift, topple, or otherwise become unstable?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end


category = Category.create!(name: "Ventilation")
[
"Is the volume and velocity of air in each exhaust system sufficient to gather the dusts, fumes, mists, vapors or gases to be controlled, and to convey them to a suitable point of disposal?",
"Are exhaust inlets, ducts and plenums designed, constructed, and supported to prevent collapse or failure of any part of the system?",
"Are clean-out ports or doors provided at intervals not to exceed 12 feet in all horizontal runs of exhaust ducts?",
"Where two or more different type of operations are being controlled through the same exhaust system, will the combination of substances being controlled, constitute a fire, explosion or chemical reaction hazard in the duct?",
"Is adequate makeup air provided to areas where exhaust systems are operating?",
"Is the intake for makeup air located so that only clean, fresh air, which is free of contaminates, will enter the work environment?",
"Where two or more ventilation systems are serving a work area, is their operation such that one will not offset the functions of the other?",
"Does your HVAC system provide at least the quantity of outdoor air required by the State Building Standards Code, Title 24, Part 2 at the time the building was constructed?",
"Is the HVAC system inspected at least annually, and problems corrected?",
"Are inspection records retained for at least 5 years?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Walkways")
[
"Are aisles and passageways kept clear?",
"Are aisles and walkways marked as appropriate?",
"Are wet surfaces covered with non-slip materials?",
"Are holes in the floor, sidewalk or other walking surface repaired properly, covered or otherwise made safe?",
"Is there safe clearance for walking in aisles where motorized or mechanical handling equipment is operating? Are spilled materials cleaned up immediately?",
"Are materials or equipment stored in such a way that sharp projectiles will not interfere with the walkway?",
"Are changes of direction or elevations readily identifiable?",
"Are aisles or walkways that pass near moving or operating machinery, welding operations or similar operations arranged so employees will not be subjected to potential hazards?",
"Is adequate headroom provided for the entire length of any aisle or walkway?",
"Are standard guardrails provided wherever aisle or walkway surfaces are elevated more than 30 inches above any adjacent floor or the ground?",
"Are bridges provided over conveyors and similar hazards?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end

category = Category.create!(name: "Welding, Cutting, and Brazing")
[
"Are only authorized and trained personnel permitted to use welding, cutting or brazing equipment?",
"Do all operators have a copy of the appropriate operating instructions and are they directed to follow them? ",
"Are precautions taken to prevent the mixture of air or oxygen with flammable gases, except at a burner or in a standard torch?",
"Are compressed gas cylinders regularly examined for obvious signs of defects, deep rusting, or leakage? ",
"Is care used in handling and storage of cylinders, safety valves, relief valves, and the like, to prevent damage?",
"Are only authorized and trained personnel permitted to use welding, cutting, or brazing equipment?",
"Are compressed gas cylinders regularly examined for obvious signs of defects, deep rusting, or leakage?",
"Is care used in handling and storage of cylinders, safety valves, etc., to prevent damage?",
"Are precautions taken to prevent the mixture of air or oxygen with flammable gases, except at a burner or in a standard touch?",
"Are only approved apparatus (torches, regulators, pressure-reducing valves, acetylene generators, manifolds) used?",
"Are cylinders kept away from elevators, stairs, or gangways?",
"Is it prohibited to use cylinders as rollers or supports?",
"Are empty cylinders appropriately marked and their valves closed?",
"Are signs reading: DANGER-NO SMOKING, NO-MATCHES, OR NO-OPEN-LIGHTS, or the equivalent posted?",
"Are cylinders, cylinder valves, couplings, regulators, hoses, and apparatus kept free of oily or greasy substances?",
"Is care taken not to drop or strike cylinders?",
"Unless secured on special trucks, are regulators removed and valve-protection caps put in place before moving cylinders?",
"Do cylinders have keys, handles, or non-adjustable wrenches on stem valves in service?",
"Are liquefied gases stored and shipped valve-end up with valve covers in place?",
"Are provisions made to never crack a fuel-gas cylinder valve near sources of ignition?",
"Before a regulator is removed, is the valve closed and gas released from the regulator?",
"Is red used to identify the acetylene (and other fuel-gas) hose, green for Oxygen hose, and black for inert gas and air hose?",
"Are pressure-reducing regulators used only for the gas and pressures for which they are intended?",
"Is open circuit (no load) voltage of arc welding and cutting machines as low as possible and not in excess of the recommended limits?",
"Under wet conditions, are automatic controls for reducing no load voltage use?",
"Is grounding of the machine frame and safety ground connections of portable machines checked periodically?",
"Are electrodes removed from the holders when not in use?",
"Is it required that electric power to the welder be shut off when no one is in attendance?",
"Is suitable fire extinguishing equipment available for immediate use?",
"Is the welder forbidden to coil or loop welding electrode cable around his body?",
"Are wet machines thoroughly dried and tested before being used?",
"Are work and electrode lead cables frequently inspected for wear and damage and replaced when needed?",
"Do means for connecting cable lengths have adequate insulation?",
"When the object to be welded cannot be moved and fire hazards cannot be removed, are shields used to confine heat, sparks, and slag?",
"Are fire watchers assigned when welding or cutting is performed in locations where a serious fire might develop?",
"Are combustible floors kept wet, covered by damp sand, or protected by fire-resistant shields?",
"When floors are wet down, are personnel protected from possible electrical shock?"
].each do |question_name| 
  category.questions.create!(body: question_name)
end
