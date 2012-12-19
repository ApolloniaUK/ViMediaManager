#tag ClassProtected Class MediaDetailsInherits Canvas	#tag Method, Flags = &h0		Sub DrawBackdrop(g as Graphics, BackdropIMG as Picture)		  		  If ActiveSection = 0 And BackdropIMG = Nil Then BackdropIMG = IMGmovies		  If ActiveSection = 1 And BackdropIMG = Nil Then BackdropIMG = IMGtvshows		  		  Dim Factor as Double = Me.Width / BackdropIMG.Width		  Dim Pic as New Picture( BackdropIMG.Width * Factor, BackdropIMG.Height * Factor, 32 )		  		  g.DrawPicture BackdropIMG,      0, 0, Pic.Width, Pic.Height,   0, 0, BackdropIMG.Width,      BackdropIMG.Height		  		  If Prefs.boolForKey("DarkUI") Then		    g.DrawGradient( RGBa( 0, 0, 0, 55 ), RGBa( 0, 0, 0, 100 ), 0, 0, g.Width, pic.Height )		  Else		    'g.DrawPicture IMGFanartOverlay, 0, 0, pic.Width, pic.Height,   0, 0, IMGFanartOverlay.Width, IMGFanartOverlay.Height		    g.DrawGradient( RGBa( 100, 100, 100, 73 ), RGBa( 100, 100, 100, 100 ), 0, 0, g.Width, pic.Height )		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DrawBanner(g as Graphics, BannerIMG as Picture)		  If BannerIMG = Nil Then Return		  		  g.DrawPicture BannerIMG,     20 + 1,          Me.Height - ( BannerOverlay.Height / 2 ) + ( 8 / 2 ) - 8,  ( BannerOverlay.Width / 2 ) - 14, ( BannerOverlay.Height / 2 ) - 7,   0, 0, BannerIMG.Width, BannerIMG.Height		  g.DrawPicture BannerOverlay, 20 - ( 12 / 2 ), Me.Height - ( BannerOverlay.Height / 2 ) + ( 8 / 2 ) - 10,   BannerOverlay.Width / 2,         BannerOverlay.Height / 2,         0, 0, BannerOverlay.Width, BannerOverlay.Height		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DrawLogoBottom(g as Graphics, ClearArtIMG as Picture, LogoIMG as Picture)		  		  If ClearArtIMG <> Nil Then		    g.DrawPicture ClearArtIMG, Me.Width - ( 500 * 0.80 ), Me.Height - ( 281 * 0.80 ) + 1, ( 500 * 0.80 ), ( 281 * 0.80 ),     0, 0, ClearArtIMG.Width, ClearArtIMG.Height		  ElseIf LogoIMG <> Nil Then		    g.DrawPicture LogoIMG, Me.Width - 400 - 20, Me.Height - 155 - 20, 400, 155,     0, 0, LogoIMG.Width, LogoIMG.Height		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DrawLogoTop(g as Graphics, StudioIMG as Picture, LogoIMG as Picture, ClearArtAvailable as Boolean)		  // ## Draw Studio Logo		  If StudioIMG <> Nil Then		    g.DrawPicture StudioIMG, Me.Width - 161 - 20, 0, 161, 109,     0, 0, StudioIMG.Width, StudioIMG.Height		  End If		  		  // Draw sub studio - Logo		  If LogoIMG <> Nil And ClearArtAvailable Then		    Dim Top as Integer = 10		    If StudioIMG <> Nil Then Top = 109		    g.ScaleImage LogoIMG, 161, 109,  Me.Width - 161 - 20, Top		    		    'g.ForeColor = &cFF0000		    'g.DrawRect( g.Width - 20 - 161, Top, 161, ScaledDim( LogoIMG, 161, 109, False ) ) ' 109 )		    'g.DrawPicture LogoIMG, Me.Width - 161 - 20, Top, 161, 109,  0, 0, LogoIMG.Width, LogoIMG.Height		  End If		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DrawPoster(g as Graphics, PosterIMG as Picture, Rating as Double = - 1)		  		  If PosterIMG = Nil Then Return		  		  // Draw Poster		  g.DrawPicture posterbg, -32, 2		  g.DrawPicture PosterIMG, 53 - 32, 16 + 2, 145, 217, 0, 0, PosterIMG.Width, PosterIMG.Height		  		  // Movie Rating		  If True And Rating > 0 Then		    		    g.TextSize = 10		    		    Rating = Rating / 2		    Dim doub   as Integer = Val( Str( Rating ).NthField( ".", 2 ).Left(1) )		    Rating = Floor( Rating )		    		    Dim RatingStr, BGStars as String		    		    For i as Integer = 1 to Rating		      RatingStr = RatingStr + "★ "		    Next		    		    If doub > 0 And doub <= 3 Then RatingStr = RatingStr + "¼ "		    If doub > 3 And doub <  7 Then RatingStr = RatingStr + "½ "		    If doub >= 7              Then RatingStr = RatingStr + "¾ "		    		    BGStars = RatingStr		    While BGStars.Len < 10		      BGStars = BGStars + "★ "		    Wend		    		    // Ribbon		    g.ForeColor = &c88A8BD		    g.FillRect 95, g.TextSize + 20 - 5, 75, 15		    		    // Ribbon wrap around		    g.ForeColor = &c98B8CD		    g.DrawLine 166, 25, 166, 25 + 14		    		    g.ForeColor = &c7898AD		    g.DrawLine 168, 25, 168, 25 + 14		    g.ForeColor = &c6D8D9F		    g.DrawLine 169, 25, 169, 25 + 14		    		    // Ribbon Shadow		    g.Transparency = 80		    g.ForeColor = &c000000		    g.DrawLine 94, 26, 94, 25 + 15		    g.DrawLine 95, 25 + 15, 169, 25 + 15		    		    g.Transparency = 90		    g.DrawLine 93, 27, 93, 25 + 15		    g.DrawLine 93, 25 + 16, 169, 25 + 16		    		    g.Transparency = 0		    		    // Background Stars		    g.ForeColor = &c62839A		    g.DrawString BGStars,   99, g.TextSize + 20 + 6		    		    // Foreground Stars		    g.ForeColor = &cFFFFFF		    g.DrawString RatingStr, 99, g.TextSize + 20 + 6		    		  End If		End Sub	#tag EndMethod	#tag ViewBehavior		#tag ViewProperty			Name="AcceptFocus"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AcceptTabs"			Visible=true			Group="Behavior"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="AutoDeactivate"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Backdrop"			Visible=true			Group="Appearance"			Type="Picture"			EditorType="Picture"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="DoubleBuffer"			Visible=true			Group="Behavior"			InitialValue="False"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="EraseBackground"			Visible=true			Group="Behavior"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Height"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="HelpTag"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="InitialParent"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockBottom"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockLeft"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockRight"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="LockTop"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabIndex"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabPanelIndex"			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="TabStop"			Visible=true			Group="Position"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="UseFocusRing"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="Canvas"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Visible=true			Group="Position"			InitialValue="100"			Type="Integer"			InheritedFrom="Canvas"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass