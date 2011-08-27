#tag ClassProtected Class AddRemoveButtonsInherits Canvas	#tag Event		Sub DropObject(obj As DragItem, action As Integer)		  //		End Sub	#tag EndEvent	#tag Event		Sub EnableMenuItems()		  //		End Sub	#tag EndEvent	#tag Event		Sub GotFocus()		  ////		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  //		End Function	#tag EndEvent	#tag Event		Sub LostFocus()		  //		End Sub	#tag EndEvent	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  mButton = kButtonNoButton		  		  if (x > 0 and x < 23 and mAddEnabled) then mButton = kButtonAdd		  if (x < width and x >= 23 and mRemoveEnabled) then mButton = kButtonRemove		  Update		  		  return true		End Function	#tag EndEvent	#tag Event		Sub MouseDrag(X As Integer, Y As Integer)		  mButton = kButtonNoButton		  if y > 0 and y < me.Height then		    if (x > 0 and x < 23 and mAddEnabled) then mButton = kButtonAdd		    if (x < width and x >= 23 and mRemoveEnabled) then mButton = kButtonRemove		  end if		  		  Update		End Sub	#tag EndEvent	#tag Event		Sub MouseEnter()		  //		End Sub	#tag EndEvent	#tag Event		Sub MouseExit()		  //		End Sub	#tag EndEvent	#tag Event		Sub MouseMove(X As Integer, Y As Integer)		  //		End Sub	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  if y > 0 and y < me.Height then		    if (x > 0 and x < 23 and mAddEnabled) then Add		    if (x < width and x >= 23 and mRemoveEnabled) then Remove		  end if		  		  mButton = kButtonNoButton		  Update		End Sub	#tag EndEvent	#tag Event		Sub Open()		  Open		  mAddEnabled = true		  mRemoveEnabled = true		End Sub	#tag EndEvent	#tag Event		Sub Paint(g As Graphics)		  Update		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Function AddEnabled() As Boolean		  return mAddEnabled		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub AddEnabled(Assigns pEnabled as Boolean)		  mAddEnabled = pEnabled		  Update		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function RemoveEnabled() As Boolean		  return mRemoveEnabled		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub RemoveEnabled(Assigns pEnabled as Boolean)		  mRemoveEnabled = pEnabled		  Update		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Update()		  dim g as Graphics		  		  // Setup		  g = me.Graphics		  		  		  // Draw Normal		  if mButton <> kButtonAdd then		    if mAddEnabled then		      g.DrawPicture PicAdd, 0, 0		    else		      g.DrawPicture PicAddDisabled, 0, 0		    end if		  end if		  		  if mButton <> kButtonRemove then		    if mRemoveEnabled then		      g.DrawPicture PicRemove, 23, 0		    else		      g.DrawPicture PicRemoveDisabled, 23, 0		    end if		  end if		  		  // Draw Down		  if mButton = kButtonAdd then		    g.DrawPicture PicAddPressed, 0, 0		  end if		  		  if mButton = kButtonRemove then		    g.DrawPicture PicRemovePressed, 23, 0		  end if		End Sub	#tag EndMethod	#tag Hook, Flags = &h0		Event Add()	#tag EndHook	#tag Hook, Flags = &h0		Event Open()	#tag EndHook	#tag Hook, Flags = &h0		Event Remove()	#tag EndHook	#tag Property, Flags = &h21		Private mAddEnabled As Boolean	#tag EndProperty	#tag Property, Flags = &h21		Private mButton As Integer	#tag EndProperty	#tag Property, Flags = &h21		Private mRemoveEnabled As Boolean	#tag EndProperty	#tag Property, Flags = &h21		Private mState As Integer	#tag EndProperty	#tag Constant, Name = kButtonAdd, Type = Integer, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = kButtonNoButton, Type = Integer, Dynamic = False, Default = \"0", Scope = Private	#tag EndConstant	#tag Constant, Name = kButtonRemove, Type = Integer, Dynamic = False, Default = \"2", Scope = Private	#tag EndConstant	#tag Constant, Name = kStateDown, Type = Integer, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = kStateUp, Type = Integer, Dynamic = False, Default = \"0", Scope = Private	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="AcceptFocus"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AcceptTabs"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AutoDeactivate"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Backdrop"			Visible=true			Group="Appearance"			Type="Picture"			EditorType="Picture"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="DoubleBuffer"			Visible=true			Group="Behavior"			InitialValue="False"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="EraseBackground"			Visible=true			Group="Behavior"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Height"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="HelpTag"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="InitialParent"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockBottom"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockLeft"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockRight"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockTop"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabIndex"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabPanelIndex"			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabStop"			Visible=true			Group="Position"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="UseFocusRing"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass