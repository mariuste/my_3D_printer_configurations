; CoreXY sample config file for dc42 Duet firmware

M111 S0                             ; Debug off
M550 mostFun_Pro				            ; Machine name (can be anything you like)
M551 Preprap                        ; Machine password (used for FTP connections)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED ; MAC Address
;*** Adjust the IP address and gateway in the following 2 lines to suit your network
M552 P0.0.0.0						; IP address (0 = use DHCP)
M554 P192.168.1.1                   ; Gateway
M553 P255.255.255.0                 ; Netmask
M555 P2                             ; Set output to look like Marlin
M575 P1 B57600 S1			          		; Comms parameters for PanelDue
M552 S1 														; enable WiFi

; Machine configuration
M569 P0 S1							; Drive 0 goes forwards (change to S0 to reverse it)
M569 P1 S1							; Drive 1 goes forwards
M569 P2 S1							; Drive 2 goes forwards
M569 P3 S0							; Drive 3 goes backwards

; If you use an endstop switch for Z homing, change Z0 to Z1 in the following line, and see also M558 command later in this file
M574 X1 Y1 Z2 S0					; set endstop configuration (Microswitches, X and Y Low End, Z High End, active low)

M667 S1								; set CoreXY mode

M350 X16 Y16 I1 ; Configure microstepping with interpolation (16 -> 256interpolated)
M350 E16				;

M92 X80 Y80 Z400					; Set axis steps/mm
M92 E96,96									; Set extruder steps/mm

M906 X800 Y800 Z1200 E800            ; Set motor currents (mA)
M201 X800 Y800 Z150 E1000            ; Accelerations (mm/s^2)
M203 X15000 Y15000 Z1000 E3600       ; Maximum speeds (mm/min)
M566 X600 Y600 Z30 E20              ; Maximum jerk speeds mm/minute
M208 X200 Y170 Z171.5									; set axis maxima (adjust to suit your machine)
M208 X-8 Y0 Z0 S1										; set axis minima (adjust to make X=0 and Y=0 the edges of the bed)
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; Z probe
M558 P4 X0 Y0 Z1                    ; mircroswitch Z-probe /to be validated (connected to E0)
M574 E0 S0 													; invert enstop input

G31 Z1.20 P500                      ; Set the probe height and threshold (put your own values here) /to be validated
; The following M557 commands are not needed if you are using a bed.g file to perform bed compensation
;*** Adjust the XY coordinates in the following M557 commands to suit your build and the position of the Z probe
M557 P0 X60 Y0                      ; Four... 
M557 P1 X60 Y165                    ; ...probe points...
M557 P2 X222 Y165                   ; ...for bed...
M557 P3 X222 Y0                     ; ...levelling
;M557 P4 X141 Y82.5                 ; 5th probe point for levelling

; Thermistors and heaters
;*** If you have a Duet board with 1K thermistor series resistors, change R4700 to R1000 to the following M305 commands
; You can also use S and B parameters to define the parameters of the thermistors you are using
M305 P0 R4700 H0 L0					; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4138  R4700 H0 L0; Set thermistor + ADC parameters for heater 1

M307 H0 A111.9, C737.6, D2.3 S1.0       ; PID settings for heating bed
M307 H1 A258.6, C162.7, D4.1 S0.5       ; PID settings for extruder 0

M570 S120							; Increase to allow extra heating time if needed

; Fan control
M106 P0 T45 H1				; Turn on fan 0 when heater 0 (hotend) is above 45C

; Tool definition
M563 P0 D0 H1                       ; Define tool 0
G10 P0 S0 R0                        ; Set tool 0 operating and standby temperatures
;*** If you have a dual-nozzle build, un-comment the following 3 lines
;M563 P1 D1 H2                      ; Define tool 1
;G10 P1 S0 R0                       ; Set tool 1 operating and standby temperatures

;*** If you are using axis compensation, put the figures in the following command
M556 S78 X0 Y0 Z0                   ; Axis compensation here
T0									; select first hot end
