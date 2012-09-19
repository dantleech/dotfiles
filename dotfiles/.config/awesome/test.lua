require("volume")
local widget = { type="textbox", name="tb_volume", align="right"};
volume.volume("update", widget);
print(widget.text);
