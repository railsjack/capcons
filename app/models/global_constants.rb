module GlobalConstants
  # This is a constants file that doesn't require a server restart and you can use these constants like GlobalConstants::STORAGE
  class Answers
    DEFAULT_STATUS = 0
    STATUSES = [["N/A", 0 ] ,["YES", 1 ] , ["NO", 2],["Resolved", 3] ]
  end

  class Users
    ROLES = {client: "client", admin: "admin", subordinate: "subordinates"} 
    STATUSES = [["N/A", 0 ] ,["Correct", 1 ] , ["Worng", 2] ]
  end
end
