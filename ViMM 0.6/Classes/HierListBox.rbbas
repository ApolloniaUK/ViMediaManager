#tag ClassProtected Class HierListBoxInherits Listbox	#tag Event		Function KeyDown(Key As String) As Boolean		  // Let the listbox handle up/down arrows and tab keys		  If Keyboard.AsyncKeyDown(&h7D) Or Keyboard.AsyncKeyDown(&h7E) Or Keyboard.AsyncKeyDown(&h30) Then Return False		  		  // Arrow Keys		  If Me.ListIndex >= 0 Then		    		    		    Select Case Asc(Key)		      		    Case 28 // Left Arrow		      If Me.RowTag( Me.ListIndex ) = "Folder" Then		        If Keyboard.AsyncCommandKey Then Me.AllExpanded False Else Me.Expanded( Me.ListIndex ) = False		      Else		        Me.ListIndex = Me.ParentIndex( Me.ListIndex )		      End If		      Return True		      		    Case 29 // Right Arrow		      If Me.RowTag( Me.ListIndex ) = "Folder" Then		        If Keyboard.AsyncCommandKey Then Me.AllExpanded True Else Me.Expanded( Me.ListIndex ) = True		      End If		      Return True		      		    End Select		    		  End If		  		  Return KeyDown( Key )		End Function	#tag EndEvent	#tag Method, Flags = &h1		Protected Sub AllExpanded(b as Boolean)		  For i as Integer = Me.ListCount - 1 DownTo 0		    If Me.RowTag( i ) = "Folder" Then Me.Expanded( i ) = b		  Next		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Function ParentIndex(CurrentIndex as Integer) As Integer		  For i as Integer = CurrentIndex DownTo 0		    If Me.RowTag( i ) = "Folder" Then Return i		  Next		End Function	#tag EndMethod	#tag Hook, Flags = &h0		Event KeyDown(Key as String) As Boolean	#tag EndHook	#tag ViewBehavior		#tag ViewProperty			Name="AutoDeactivate"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="AutoHideScrollbars"			Visible=true			Group="Behavior"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Bold"			Visible=true			Group="Font"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Border"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="ColumnCount"			Visible=true			Group="Appearance"			InitialValue="1"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="ColumnsResizable"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="ColumnWidths"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="DataField"			Visible=true			Group="Database Binding"			Type="String"			EditorType="DataField"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="DataSource"			Visible=true			Group="Database Binding"			Type="String"			EditorType="DataSource"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="DefaultRowHeight"			Visible=true			Group="Appearance"			InitialValue="-1"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="EnableDrag"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="EnableDragReorder"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="GridLinesHorizontal"			Visible=true			Group="Appearance"			InitialValue="0"			Type="Integer"			EditorType="Enum"			InheritedFrom="Listbox"			#tag EnumValues				"0 - Default"				"1 - None"				"2 - ThinDotted"				"3 - ThinSolid"				"4 - ThickSolid"				"5 - DoubleThinSolid"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="GridLinesVertical"			Visible=true			Group="Appearance"			InitialValue="0"			Type="Integer"			EditorType="Enum"			InheritedFrom="Listbox"			#tag EnumValues				"0 - Default"				"1 - None"				"2 - ThinDotted"				"3 - ThinSolid"				"4 - ThickSolid"				"5 - DoubleThinSolid"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="HasHeading"			Visible=true			Group="Appearance"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="HeadingIndex"			Visible=true			Group="Appearance"			InitialValue="-1"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Height"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="HelpTag"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Hierarchical"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="InitialParent"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="InitialValue"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Italic"			Visible=true			Group="Font"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="LockBottom"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="LockLeft"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="LockRight"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="LockTop"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="RequiresSelection"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="ScrollbarHorizontal"			Visible=true			Group="Appearance"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="ScrollBarVertical"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="SelectionType"			Visible=true			Group="Behavior"			InitialValue="0"			Type="Integer"			EditorType="Enum"			InheritedFrom="Listbox"			#tag EnumValues				"0 - Single"				"1 - Multiple"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="TabIndex"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="TabPanelIndex"			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="TabStop"			Visible=true			Group="Position"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="TextFont"			Visible=true			Group="Font"			InitialValue="System"			Type="String"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="TextSize"			Visible=true			Group="Font"			InitialValue="0"			Type="Single"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="TextUnit"			Visible=true			Group="Font"			InitialValue="0"			Type="FontUnits"			EditorType="Enum"			InheritedFrom="Listbox"			#tag EnumValues				"0 - Default"				"1 - Pixel"				"2 - Point"				"3 - Inch"				"4 - Millimeter"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Underline"			Visible=true			Group="Font"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="UseFocusRing"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="_ScrollOffset"			Group="Appearance"			InitialValue="0"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty		#tag ViewProperty			Name="_ScrollWidth"			Group="Appearance"			InitialValue="-1"			Type="Integer"			InheritedFrom="Listbox"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass