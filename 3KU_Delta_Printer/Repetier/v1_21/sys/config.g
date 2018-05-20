; Configuration file for dc42 Kossel

; Communication and general
M111 S0                             ; Debug off
M550 3KU_Delta      		        		; Machine name (can be anything you like)
M551 Preprap                        ; Machine password (used for FTP)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0x42 ; MAC Address
;*** Adjust the IP address and gateway in the following 2 lines to suit your network
M552 P0.0.0.0						; IP address (0 = use DHCP)
M554 P192.168.0.254                 ; Gateway
M553 P255.255.255.0                 ; Netmask
M555 P2                             ; Set output to look like Marlin
M575 P1 B57600 S1                   ; Set auxiliary serial port baud rate and require checksum (for PanelDue)
M552 S1

; Axis and motor configuration
M569 P0 S1							; Drive 0 goes forwards
M569 P1 S1							; Drive 1 goes forwards
M569 P2 S1							; Drive 2 goes forwards
M569 P3 S0							; Drive 3 goes backwards

; Endstops
M574 X2 Y2 Z2 S0 ; Define active low and unused microswitches

M665 L228 R108 H243.5 B85 X0 Y0; Set delta radius, diagonal rod length, printable radius and homed height

M666 X0 Y0 Z0						; put your endstop adjustments here, or use auto calibration to find them
M208 Z0 S1 ; Set minimum Z

M350 X32 Y32 Z32 E16 I0 ; Configure microstepping with interpolation

M92 X160 Y160 Z160 E96 ; Set steps per mm

; Motor current, speed and acceleration
M906 X600 Y600 Z600 E800 ; Set motor currents (mA) 

M201 X800 Y800 Z800 E1000 ; Set accelerations (mm/s^2)

M203 X18000 Y18000 Z18000 E12000 ; Set maximum speeds (mm/min)

M566 X500 Y500 Z500 E1000 ; Set maximum instantaneous speed changes (mm/min)

G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; Thermistors and heaters
M305 P1 T100000 B4138  R4700 H0 L0; Set thermistor + ADC parameters for heater 1

M301 H0 P20 I0.5 D1000 T0.85 W150 B5 ; PID settings for the bed
M307 H1 A183.1, C149.0, D7.1 S0.5       ; PID settings for extruder 0

M570 S200							; Allow extra heating time

; Tool definitions
M563 P0 D0 H1                       ; Define tool 0
G10 P0 S0 R0                        ; Set tool 0 operating and standby temperatures

; Z probe and compensation definition
M558 P5 X0 Y0 Z0 H2 F30 T5000 ; Set Z probe type to switch, the axes for which it is used and the probe + travel speeds
M557 R85 S20 ; Define mesh grid

G31 P1 X-24 Y13.86 Z3 ; Set Z probe trigger value, offset and trigger height

; Custom settings are not configured
M307 H3 A-1 C-1 D-1 ; reserve pin H3 for M42 command

;*** If you are using axis compensation, put the figures in the following command
M556 S78 X0 Y0 Z0                   ; Axis compensation here

M207 S7.0 F3600 Z0.1				; Set firmware retraction details
M572 D0 S0.1						; set pressure advance

T0									; select first print head
