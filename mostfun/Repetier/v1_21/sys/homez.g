G91 ; relative mode
G1 S1 Z250 F500  ; move Z towards the switch until it triggers
G1 Z-5 F100 S2 ; move Z back 5mm
G1 S1 Z10 F100 ; move Z slowly towards the switch until it triggers
G1 Z-5 F500 ; leave entstop
G90 ; back to absolute mode