extends Node
var current_tool = DataTypes.Tools.None

signal tool_change(tool:DataTypes.Tools)

func select_tool(tool:DataTypes.Tools)->void:
	self.current_tool = tool
	self.tool_change.emit(tool)
