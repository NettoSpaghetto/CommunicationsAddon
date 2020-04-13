/*----------------------------
Hello, welcome to the config file!!!
If you want to create a group, follow the template below!
comms_createCommsGroup(
    "group name", ------- e.g. "Security", "MTF" etc.
    "command", -------------- e.g. for /sec, put 'sec' here without the quotes.
    Color, ----- e.g. Color(0,0,0)
    {"JOB NAMES"} ---- This should be the name of the job, not the TEAM_ or command!
)
----------------------------*/

comms_createCommsGroup(
    "Security",
    "sec",
    Color(0,0,0),
    {"Citizen", "Civil Protection"}
)

comms_createCommsGroup(
    "Hobo World",
    "ho",
    Color(200,200,200),
    {"Hobo"}
)