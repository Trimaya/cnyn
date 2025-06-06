-- CleWin Parameters --
-- CLength
-- CWidth
-- Layer Definition --
LAYER_SEMICONDUCTOR = 0
LAYER_VIA = 1
LAYER_CONTACT = 2
LAYER_PADS = 3
-- Parameter Definition --
VIA_BORDER = 4
CONTACT_BORDER = 2
VIA_WIDTH = 5
WIRE_WIDTH = 20
CONTACTPAD_SIZE = 150
CONTACTPAD_Y = 300
CONTACTPAD_DX = 600
TEXT_HEIGHT = 110
PAD_OFFSET = 5
-- Device Value Definition --
VIA_LENGTH = 0
VIA_LENGTH = CWidth
CONTACT_WIDTH = 0
CONTACT_WIDTH = VIA_WIDTH + 2*VIA_BORDER
CONTACT_LENGTH = 0
CONTACT_LENGTH = VIA_LENGTH + 2*VIA_BORDER
SEMICONDUCTOR_WIDTH = 0
SEMICONDUCTOR_WIDTH = CLength + 2*VIA_WIDTH + 2*VIA_BORDER + 2*CONTACT_BORDER
SEMICONDUCTOR_LENGTH = 0
SEMICONDUCTOR_LENGTH = CWidth + 2*VIA_BORDER + 2*CONTACT_BORDER
-- Drawing Layout --
-- Semiconductor Layout --
setlayer(LAYER_SEMICONDUCTOR)
rectangle(0,0,SEMICONDUCTOR_WIDTH,SEMICONDUCTOR_LENGTH)
-- Via Layout --
setlayer(LAYER_VIA)
x = VIA_BORDER+CONTACT_BORDER
y = VIA_BORDER+CONTACT_BORDER
rectangle(x,y,x+VIA_WIDTH,y+VIA_LENGTH)
x = SEMICONDUCTOR_WIDTH-CONTACT_BORDER-VIA_BORDER-VIA_WIDTH
y = VIA_BORDER+CONTACT_BORDER
rectangle(x,y,x+VIA_WIDTH,y+VIA_LENGTH)
-- Contact Layout --
setlayer(LAYER_CONTACT)
x = CONTACT_BORDER
y = CONTACT_BORDER
rectangle(x,y,x+CONTACT_WIDTH,y+CONTACT_LENGTH)
x = SEMICONDUCTOR_WIDTH-CONTACT_BORDER-CONTACT_WIDTH
y = CONTACT_BORDER
rectangle(x,y,x+CONTACT_WIDTH,y+CONTACT_LENGTH)
-- Contact to device border --
x = 0
y = SEMICONDUCTOR_LENGTH/2-WIRE_WIDTH/2
rectangle(x,y,x+CONTACT_BORDER,y+WIRE_WIDTH)
x = SEMICONDUCTOR_WIDTH-CONTACT_BORDER
y = SEMICONDUCTOR_LENGTH/2-WIRE_WIDTH/2
rectangle(x,y,x+CONTACT_BORDER,y+WIRE_WIDTH)
-- Contacts --
x = SEMICONDUCTOR_WIDTH/2-CONTACTPAD_DX/2-CONTACTPAD_SIZE/2
y = CONTACTPAD_Y
rectangle(x,y,x+CONTACTPAD_SIZE,y+CONTACTPAD_SIZE)
x = SEMICONDUCTOR_WIDTH/2+CONTACTPAD_DX/2-CONTACTPAD_SIZE/2
Y = CONTACTPAD_Y
rectangle(x,y,x+CONTACTPAD_SIZE,y+CONTACTPAD_SIZE)
-- Wires --
wire(0,WIRE_WIDTH,{SEMICONDUCTOR_WIDTH/2-CONTACTPAD_DX/2,CONTACTPAD_Y,
SEMICONDUCTOR_WIDTH/2-CONTACTPAD_DX/2,SEMICONDUCTOR_LENGTH/2,
0,SEMICONDUCTOR_LENGTH/2})
wire(0,WIRE_WIDTH,{SEMICONDUCTOR_WIDTH/2+CONTACTPAD_DX/2,CONTACTPAD_Y,
SEMICONDUCTOR_WIDTH/2+CONTACTPAD_DX/2,SEMICONDUCTOR_LENGTH/2,
SEMICONDUCTOR_WIDTH-CONTACT_BORDER,SEMICONDUCTOR_LENGTH/2})
-- Text --
str = string.format("%d/%dum",CWidth,CLength) --μ
text(str,{1,0,0,1,SEMICONDUCTOR_WIDTH/2-CONTACTPAD_DX/2-CONTACTPAD_SIZE/2+10,-TEXT_HEIGHT})
-- Pads --
setlayer(LAYER_PADS)
x = SEMICONDUCTOR_WIDTH/2-CONTACTPAD_DX/2-CONTACTPAD_SIZE/2+PAD_OFFSET
y = CONTACTPAD_Y+PAD_OFFSET
rectangle(x,y,x+CONTACTPAD_SIZE-2*PAD_OFFSET,y+CONTACTPAD_SIZE-2*PAD_OFFSET)
x = SEMICONDUCTOR_WIDTH/2+CONTACTPAD_DX/2-CONTACTPAD_SIZE/2+PAD_OFFSET
Y = CONTACTPAD_Y+PAD_OFFSET
rectangle(x,y,x+CONTACTPAD_SIZE-2*PAD_OFFSET,y+CONTACTPAD_SIZE-2*PAD_OFFSET)