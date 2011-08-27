#tag ModuleProtected Module Globals	#tag Method, Flags = &h0		Function AbbrLang(Language as String) As String		  select case language		    		    // Full length language name to abbriviation		  case "English"		    return "en"		  case "Nederlands"		    return "nl"		  case "Dansk"		    return "da"		  case "Suomeksi"		    return "fi"		  case "Deutsch"		    return "de"		  case "Italiano"		    return "it"		  case "Español"		    return "es"		  case "Français"		    return "fr"		  case "Polski"		    return "pl"		  case "Magyar"		    Return "hu"		  case "Ελληνικά" // Greece		    return "el"		  case "Türkçe" // Turkish		    return "tr"		  case "русский язык" // Russian		    return "ru"		  case "עברית" // Hebrew		    return "he"		  case "日本語" // Japanese		    return "ja"		  case "Português"		    return "pt"		  case "中文" // Chinese / Mandarin		    return "zh"		  case "čeština"		    return "cs"		  case "Slovenski"		    return "sl"		  case "Hrvatski"		    return "hr"		  case "한국어" // Korean		    return "ko"		  case "Norsk"		    return "no"		    		    // And in reverse!		  case "en"		    return "English"		  case "nl"		    return "Nederlands"		  case "da"		    return "Dansk"		  case "fi"		    return "Suomeksi"		  case "de"		    return "Deutsch"		  case "it"		    return "Italiano"		  case "es"		    return "Español"		  case "fr"		    return "Français"		  case "pl"		    return "Polski"		  case "hu"		    Return "Magyar"		  case "el" // Greece		    return "Ελληνικά"		  case "tr" // Turkish		    return "Türkçe"		  case "ru" // Russian		    return "русский язык"		  case "he" // Hebrew		    return "עברית"		  case "ja" // Japanese		    return "日本語"		  case "pt"		    return "Português"		  case "zh" // Chinese / Mandarin		    return "中文"		  case "cs" // Czech		    return "čeština"		  case "sl"		    return "Slovenski"		  case "hr"		    return "Hrvatski"		  case "ko" // Korean		    return "한국어"		  case "no"		    return "Norsk"		    		  end Select		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Articulator(ItemName As String, ItemYear as String = "") As String		  		  		  // The --------------------------------------------------------		  if ItemName.Left(4) = "The " then		    if ItemName.Right(7) = " (" + Itemyear + ")" then		      ItemName = ItemName.Left( ItemName.Len - 7 )		      ItemName = ItemName.Right( ItemName.Len - 4)		      ItemName = ItemName + ", The (" + Itemyear + ")"		    elseif ItemName.Right(5) = " " + ItemYear then		      ItemName = ItemName.Left( ItemName.Len - 5 )		      ItemName = ItemName.Right( ItemName.Len - 4 )		      ItemName = ItemName + ", The " + ItemYear		    else		      ItemName = ItemName.Right(ItemName.LenB - 4) + ", The"		    end if		  end if // @END 'The' filtering		  		  		  // A		  if ItemName.Left(2) = "A " then		    if ItemName.Right(7) = " (" + Itemyear + ")" then		      ItemName = ItemName.Left( ItemName.Len - 7 )		      ItemName = ItemName.Right( ItemName.Len - 2)		      ItemName = ItemName + ", A (" + Itemyear + ")"		    elseif ItemName.Right(5) = " " + ItemYear then		      ItemName = ItemName.Left( ItemName.Len - 5 )		      ItemName = ItemName.Right( ItemName.Len - 2 )		      ItemName = ItemName + ", A " + ItemYear		    else		      ItemName = ItemName.Right(ItemName.LenB - 2) + ", A"		    end if		  end if // @END 'The' filtering		  		  		  // An		  if ItemName.Left(3) = "An " then		    if ItemName.Right(7) = " (" + Itemyear + ")" then		      ItemName = ItemName.Left( ItemName.Len - 7 )		      ItemName = ItemName.Right( ItemName.Len - 3)		      ItemName = ItemName + ", An (" + Itemyear + ")"		    elseif ItemName.Right(5) = " " + ItemYear then		      ItemName = ItemName.Left( ItemName.Len - 5 )		      ItemName = ItemName.Right( ItemName.Len - 3 )		      ItemName = ItemName + ", An " + ItemYear		    else		      ItemName = ItemName.Right(ItemName.LenB - 3) + ", An"		    end if		  end if // @END 'The' filtering		  		  		  // Het		  if ItemName.Left(4) = "Het " then		    if ItemName.Right(7) = " (" + Itemyear + ")" then		      ItemName = ItemName.Left( ItemName.Len - 7 )		      ItemName = ItemName.Right( ItemName.Len - 4)		      ItemName = ItemName + ", Het (" + Itemyear + ")"		    elseif ItemName.Right(5) = " " + ItemYear then		      ItemName = ItemName.Left( ItemName.Len - 5 )		      ItemName = ItemName.Right( ItemName.Len - 4 )		      ItemName = ItemName + ", Het " + ItemYear		    else		      ItemName = ItemName.Right(ItemName.LenB - 4) + ", Het"		    end if		  end if // @END 'The' filtering		  		  		  // De		  if ItemName.Left(3) = "De " then		    if ItemName.Right(7) = " (" + Itemyear + ")" then		      ItemName = ItemName.Left( ItemName.Len - 7 )		      ItemName = ItemName.Right( ItemName.Len - 3)		      ItemName = ItemName + ", De (" + Itemyear + ")"		    elseif ItemName.Right(5) = " " + ItemYear then		      ItemName = ItemName.Left( ItemName.Len - 5 )		      ItemName = ItemName.Right( ItemName.Len - 3 )		      ItemName = ItemName + ", De " + ItemYear		    else		      ItemName = ItemName.Right(ItemName.LenB - 3) + ", De"		    end if		  end if // @END 'The' filtering		  		  Return ItemName		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub CleanTemporaryFiles()		  Dim f as FolderItem		  Dim i, n as integer		  f =  SpecialFolder.Temporary		  		  // Brute force attack!		  for n = 0 to 5		    for i = 1 to f.Count		      if f.Item(i).Name.Right(4) = ".jpg" or f.Item(i).Name.Right(4) = ".png" or f.Item(i).Name.Right(4) = ".flv" then f.Item(i).Delete		    next		  next		  		  'for i = 1 to f.Count		  'if f.Item(i).Name.Right(4) = ".jpg" or f.Item(i).Name.Right(4) = ".png" or f.Item(i).Name.Right(4) = ".flv" then		  'if f.Item(i).FileInUse = 104 then f.Item(i).MoveFileTo( SpecialFolder.Trash )		  'end if		  'next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function dlgPrompt(sPrompt as String, sTitle as String = "", firstdata as string = "") As String		  Dim prompt as new wndPrompt		  Dim data as String		  		  prompt.Title = stitle		  prompt.lblPrompt.Text = sPrompt		  prompt.edtInput.Text = firstdata		  prompt.edtInput.SelStart = 0		  prompt.edtInput.SelLength = len(firstdata)		  prompt.ShowModal		  		  data = prompt.data		  		  prompt.Close		  Return data		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function dlgWindow(Message as String, Explanation as string, ActionCaption as String = "OK") As Boolean		  dim dlgWindow as new MessageDialog		  dim dlgButton as MessageDialogButton		  		  // Dialogwindow settings		  dlgWindow.Icon = MessageDialog.GraphicCaution		  		  dlgWindow.ActionButton.Caption = ActionCaption		  dlgWindow.ActionButton.Visible = True		  		  dlgWindow.CancelButton.Caption = "Cancel"		  dlgWindow.CancelButton.Visible = true		  		  dlgWindow.Message = Message		  dlgWindow.Explanation = Explanation		  		  // Show dialog window		  dlgButton = dlgWindow.ShowModal		  		  select case dlgButton		  case dlgWindow.ActionButton		    return True		  case dlgWindow.CancelButton		    return False		  end select		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Entities2String(s As String) As String		  s = s.ReplaceAll("&", "&&")		  s = s.ReplaceAll(" ", "ö")		  		  return s		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function FlipImageHorizontal(P as Picture) As Picture		  dim pic as picture		  dim x,y,x2 as integer		  dim picS,maskS,picS2,maskS2 as rgBSurface		  		  pic=newpicture(p.width,p.height,p.depth)		  		  picS=p.rgbSurface		  maskS=p.mask.rgbSurface		  picS2=pic.rgbSurface		  maskS2=pic.mask.rgbSurface		  		  		  		  For x = p.width-1 downTo 0		    For y = p.height-1 downTo 0		      picS2.Pixel(x,y) = picS.Pixel(x2,y)		      maskS2.Pixel(x,y) = maskS.Pixel(x2,y)		    next		    x2=x2+1		  next		  		  return pic		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function FlipImageVertical(P as Picture) As Picture		  dim pic as picture		  dim x,y,y2 as integer		  dim picS,maskS,picS2,maskS2 as rgBSurface		  		  pic=newpicture(p.width,p.height,p.depth)		  		  picS=p.rgbSurface		  maskS=p.mask.rgbSurface		  picS2=pic.rgbSurface		  maskS2=pic.mask.rgbSurface		  		  		  		  For y = p.height-1 downTo 0		    For x = p.width-1 downTo 0		      picS2.Pixel(x,y) = picS.Pixel(x,y2)		      maskS2.Pixel(x,y) = maskS.Pixel(x,y2)		    next		    y2=y2+1		  next		  		  return pic		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GZipStringReadMBS(CompressedData as String) As String		  Dim g as new GZipFileMBS		  		  Const BlockSize = 1000000		  		  if g.OpenString( CompressedData ) then		    		    Dim parts(-1) as String		    		    while not g.EOF		      dim s as string = g.read( blocksize )		      parts.Append s		    wend		    		    Return Join ( parts, "" )		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function Int2Month(month as Integer) As string		  Select case month		    		  case 1		    Return "Jan"		  case 2		    Return "Feb"		  case 3		    Return "Mar"		  case 4		    Return "Apr"		  case 5		    Return "May"		  case 6		    Return "Jun"		  case 7		    Return "Jul"		  case 8		    Return "Aug"		  case 9		    Return "Sep"		  case 10		    Return "Okt"		  case 11		    Return "Nov"		  case 12		    Return "Dec"		    		  end select		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function isLion() As Boolean		  const kMacOSXMin = &h1070		  		  #if TargetMacOS then		    Dim res As Integer		    Dim b As Boolean = System.Gestalt( "sysv", res )		    if res >= kMacOSXMin then Return True		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub MassRenamer(lstBox as Listbox)		  Dim f, g, nfoFile, theFile as FolderItem		  Dim i, n as integer		  Dim s as String		  		  if not dlgWindow("Warning!", "Are you sure you want to mass rename your files & folders?" + chr(13) + "This cannot be undone!", "Rename") then return		  		  if wndMain.ppMedia.Value = 0 then		    		    for i = 0 to lstBox.ListCount - 1		      		      'MsgBox "Rename movies..."		      f = lstBox.CellTag( i, 0 )		      g = lstBox.CellTag( i, 0 )		      		      for n = 1 to f.Count		        		        if f.Item(n).Name.InStr(-1, ".nfo") > 0 then		          		          nfoFile = f.Item(n)		          		          if lstBox.Cell(i, 1) <> "" then		            theFile = lstBox.CellTag( i, 0 )		          end if		          		          'MsgBox f.Item(n).Name + " = " + theFile.AbsolutePath		          'MsgBox MovieAttr.ReadKey( "title", nfoFile )		        end if		        		      next		      		      s = Preferences.RenameStringMovies		      		      // Title		      s = s.ReplaceAll("$T", MovieAttr.ReadKey("title", nfoFile) )		      		      // Year		      if MovieAttr.ReadKey("year", nfoFile) <> "" then		        s = s.ReplaceAll("$Y", MovieAttr.ReadKey("year", nfoFile) )		      else		        s = s.ReplaceAll(" ($Y)", "")		        s = s.ReplaceAll("($Y)", "")		        s = s.ReplaceAll("$Y", "")		      end if		      		      // Original Title		      if MovieAttr.ReadKey("originaltitle", nfoFile) <> "" then		        s = s.ReplaceAll("$O", MovieAttr.ReadKey("originaltitle", nfoFile) )		      else		        s = s.ReplaceAll("$O", MovieAttr.ReadKey("title", nfoFile) )		      end if		      		      // SortTitle		      if MovieAttr.ReadKey("sorttitle", nfoFile) <> "" then		        s = s.ReplaceAll("$S", MovieAttr.ReadKey("sorttitle", nfoFile) )		      else		        s = s.ReplaceAll("$S", MovieAttr.ReadKey("title", nfoFile) )		      end if		      		      if s.Left(1) = "." then s = s.Replace(".", "•")		      		      s = s.ReplaceAll(":", " -") // Mac's don't allow ':' in their name.		      		      #if not TargetMacOS then // Characters not allowed on non-mac platforms		        // \/:*?"<>|		        s = s.ReplaceAll("\", " - ")		        s = s.ReplaceAll("/", " - ")		        s = s.ReplaceAll("*", "x")		        s = s.ReplaceAll("?", "")		        s = s.ReplaceAll("""", "'")		        s = s.ReplaceAll("<", "}")		        s = s.ReplaceAll(">", "{")		        s = s.ReplaceAll("|", " ")		      #endif		      		      s = s.ReplaceAll("  ", " ") // Fix double spaces		      		      		      if s <> "" and theFile <> nil then		        g = g.Parent.Child( s )		        theFile.MoveFileTo( g )		      end if		      		      		    next		    		  elseif wndMain.ppMedia.Value = 1 then		    		    for i = 0 to lstBox.ListCount - 1		      		      f = lstBox.CellTag( i, 0 )		      g = lstBox.CellTag( i, 0 )		      		      if f.Child("tvshow.nfo").Exists and TVAttr.ReadKey("title", f) <> "" then		        'MsgBox "renaming files and folders"		        s = Preferences.RenameStringTVShows		        s = s.ReplaceAll("$T", TVAttr.ReadKey("title", f) )		        		        if TVAttr.ReadKey("year", f) <> "" then		          s = s.ReplaceAll("$Y", TVAttr.ReadKey("year", f) )		        else		          s = s.ReplaceAll(" ($Y)", "")		          s = s.ReplaceAll("($Y)", "")		          s = s.ReplaceAll("$Y", "")		        end if		        		        if TVAttr.ReadKey("originaltitle", f) <> "" then		          s = s.ReplaceAll("$O", TVAttr.ReadKey("originaltitle", f) )		        else		          s = s.ReplaceAll("$O", TVAttr.ReadKey("title", f) )		        end if		        		        if TVAttr.ReadKey("sorttitle", f) <> "" then		          s = s.ReplaceAll("$S", TVAttr.ReadKey("sorttitle", f) )		        else		          s = s.ReplaceAll("$S", TVAttr.ReadKey("title", f) )		        end if		        		        if s.Left(1) = "." then s = s.Replace(".", "•")		        		        s = s.ReplaceAll(":", " -") // Mac's don't allow ':' in their name.		        		        #if not TargetMacOS then // Characters not allowed on non-mac platforms		          // \/:*?"<>|		          s = s.ReplaceAll("\", " - ")		          s = s.ReplaceAll("/", " - ")		          s = s.ReplaceAll("*", "x")		          s = s.ReplaceAll("?", "")		          s = s.ReplaceAll("""", "'")		          s = s.ReplaceAll("<", "}")		          s = s.ReplaceAll(">", "{")		          s = s.ReplaceAll("|", " ")		        #endif		        		        s = s.ReplaceAll("  ", " ") // Fix double spaces		        		        if s <> "" then		          g = g.Parent.Child( s )		          f.MoveFileTo( g )		        end if		        		      end if		      		    next		    		  elseif wndMain.ppMedia.Value = 2 then		    		    for i = 0 to lstBox.ListCount - 1		      		      f = lstBox.CellTag( i, 0 )		      g = lstBox.CellTag( i, 0 )		      		      if f.Child("tvshow.nfo").Exists and TVAttr.ReadKey("title", f) <> "" then		        'MsgBox "renaming files and folders"		        s = Preferences.RenameStringAnime		        s = s.ReplaceAll("$T", TVAttr.ReadKey("title", f) )		        		        if TVAttr.ReadKey("year", f) <> "" then		          s = s.ReplaceAll("$Y", TVAttr.ReadKey("year", f) )		        else		          s = s.ReplaceAll(" ($Y)", "")		          s = s.ReplaceAll("($Y)", "")		          s = s.ReplaceAll("$Y", "")		        end if		        		        if TVAttr.ReadKey("originaltitle", f) <> "" then		          s = s.ReplaceAll("$O", TVAttr.ReadKey("originaltitle", f) )		        else		          s = s.ReplaceAll("$O", TVAttr.ReadKey("title", f) )		        end if		        		        if TVAttr.ReadKey("sorttitle", f) <> "" then		          s = s.ReplaceAll("$S", TVAttr.ReadKey("sorttitle", f) )		        else		          s = s.ReplaceAll("$S", TVAttr.ReadKey("title", f) )		        end if		        		        if s.Left(1) = "." then s = s.Replace(".", "•")		        		        s = s.ReplaceAll(":", " -") // Mac's don't allow ':' in their name.		        		        #if not TargetMacOS then // Characters not allowed on non-mac platforms		          // \/:*?"<>|		          s = s.ReplaceAll("\", " - ")		          s = s.ReplaceAll("/", " - ")		          s = s.ReplaceAll("*", "x")		          s = s.ReplaceAll("?", "")		          s = s.ReplaceAll("""", "'")		          s = s.ReplaceAll("<", "}")		          s = s.ReplaceAll(">", "{")		          s = s.ReplaceAll("|", " ")		        #endif		        		        s = s.ReplaceAll("  ", " ") // Fix double spaces		        		        if s <> "" then		          g = g.Parent.Child( s )		          f.MoveFileTo( g )		        end if		        		      end if		      		    next		    		  end if		  		  if lstBox = wndMain.lstTVShows then		    wndMain.PopulateTVShowsList		  elseif lstBox = wndMain.lstMovies then		    wndMain.PopulateMoviesList		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function MPAA2Logo(MPAA as String) As Picture		  		  select case MPAA		    		  case "G"		    Return Rating_G		  case "PG"		    Return Rating_PG		  case "PG-13"		    Return Rating_PG13		  case "NC-17"		    Return Rating_NC17		  case "R"		    Return Rating_R		    		  case "TV-G"		    Return Rating_TVG		  case "TV-PG"		    Return Rating_TVPG		  case "TV-14"		    Return Rating_TV14		  case "TV-MA"		    Return Rating_TVMA		    		  case "TV-Y7"		    Return Rating_TVY7		  case "TV-Y"		    Return Rating_TVY		  case "TV-Y7FV"		    Return Rating_TVY7FV		    		  end select		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function MPAA2Ratings(MPAA As String) As String		  select case MPAA		    		  case "G"		    Return "G. General Audiences. All ages admitted"		    		  case "PG"		    Return "PG. Parental Guidance Suggested. Some material may not be suitable for children"		    		  case "PG-13"		    Return "PG-13. Parents Strongly Cautioned. Some material may not be appropriate for children under 13"		    		  case "R"		    Return "R. Restricted. Under 17 requires accompanying parent or adult guardian"		    		  case "NC-17"		    Return "NC-17. No One 17 and under admitted"		    		  case "NR"		    Return "Unrated"		    		  end select		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub Progressor(Action As String, Status As String = "", ProgressMax As Integer = 0, ProgressValue As Integer = 0)		  If Action = "close" then		    wndProgress.Close		    Return		  end if		  		  wndProgress.lblDownloading.Text = Action		  wndProgress.lblDownloadingValue.Text = Status		  		  if ProgressMax <= 0 then		    wndProgress.prgBar.Maximum = 0		    wndProgress.prgBar.Value   = 0		  else		    wndProgress.prgBar.Maximum = ProgressMax		    wndProgress.prgBar.Value   = ProgressValue		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function ScalePic(Pic As Picture, Width As Integer = 780, Height As Integer = 439, ScaleWidth As Boolean = True, ScaleHeight As Boolean = True, UpScale As Boolean = False) As Picture		  Dim ScaledPic as Picture		  Dim Factor As Double		  		  if Pic = nil then Return Nil		  		  if NOT ScaleHeight then		    Factor = Min( Width / Pic.Width, Pic.Height ) // Only scale width wise.		  elseif NOT ScaleWidth then		    Factor = Min( Pic.Width, Height / Pic.Height ) // Only scale height wise.		  elseif ScaleWidth and ScaleHeight then		    Factor = Min( Width / Pic.Width, Height / Pic.Height ) // Scale both		  end if		  		  if NOT UpScale then factor = Min( factor, 1.0 ) // Don't scale it up if it's too small		  		  ScaledPic = New Picture( Pic.Width * Factor, Pic.Height * Factor, 32 )		  ScaledPic.Graphics.DrawPicture      Pic,      0, 0, ScaledPic.Width, ScaledPic.Height,   0, 0, Pic.Width, Pic.Height		  ScaledPic.Mask.Graphics.DrawPicture Pic.Mask, 0, 0, ScaledPic.Width, ScaledPic.Height,   0, 0, Pic.Width, Pic.Height		  		  Return ScaledPic		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub SetAllIcons(LstBox as Listbox)		  Dim i, LstCount As Integer		  Dim Folder as FolderItem		  Dim Poster as Picture		  Dim ShowName as String		  		  LstCount = LstBox.ListCount		  		  for i = 0 to LstCount - 1		    		    if LstBox.Cell(i, 1) <> "" then		      		      Progressor( "Setting Icon:",  ShowName.ReplaceAll("&", "&&") + "...", LstCount, i )		      		      ShowName = LstBox.Cell( i, 0 )		      Folder = wndMain.lstTVShows.CellTag( i, 0 )		      		      if LstBox = wndMain.lstTVShows or LstBox = wndMain.lstAnime then		        Poster = Picture.Open( Folder.Child("Poster.jpg") )		      elseif LstBox = wndMain.lstMovies then		        Poster = Picture.Open( MovieAttr.MoviePosterFilter( Folder ) )		      end if		      		      if Poster <> nil and SetDVDIcon( Poster, Folder ) = 0 then		        Poster = nil		      end if		      		    end if		  next		  		  Progressor("close")		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function SetDVDIcon(Poster as Picture, Folder as FolderItem) As Integer		  dim ics as IconFamilyMBS		  dim pic, icn as Picture		  Dim Iconfile as FolderItem = Folder.Child( "icon" + chr(13) )		  		  if Poster = nil then		    MsgBox "Can't create a folder icon without a poster image."		    Return -1		  elseif Folder = nil then		    MsgBox "Can't create a folder icon without a folder."		    Return -1		  end if		  		  ics = NewIconFamilyMBS		  pic = Poster		  		  // 512		  icn = new Picture( 512, 512, 32 )		  icn.Graphics.DrawPicture( pic, 106, 46, 280, 415,  0, 0, pic.Width, pic.Height )		  icn.Graphics.DrawPicture( DVD512, 0, 0, 512, 512 )		  icn.Mask = DVD512Mask		  call ics.SetIconImage( icn, icn.Mask )		  		  // 256		  icn = new Picture( 256, 256, 32 )		  icn.Graphics.DrawPicture( pic, 53, 23, 140, 208,  0, 0, pic.Width, pic.Height )		  icn.Graphics.DrawPicture( DVD256, 0, 0, 256, 256 )		  icn.Mask = DVD256Mask		  call ics.SetIconImage( icn, icn.Mask )		  		  // 128		  icn = new Picture( 128, 128, 32 )		  icn.Graphics.DrawPicture( pic, 26, 12, 70, 101,  0, 0, pic.Width, pic.Height )		  icn.Graphics.DrawPicture( DVD128, 0, 0, 128, 128 )		  icn.Mask = DVD128Mask		  call ics.SetIconImage( icn, icn.Mask )		  		  // 48		  icn = new Picture( 48, 48, 32 )		  icn.Graphics.DrawPicture( pic, 10, 4, 26, 38,  0, 0, pic.Width, pic.Height )		  icn.Graphics.DrawPicture( DVD48, 0, 0, 48, 48 )		  icn.Mask = DVD48Mask		  call ics.SetIconImage( icn, icn.Mask )		  		  // 32		  icn = new Picture( 32, 32, 32 )		  icn.Graphics.DrawPicture( pic, 6, 2, 19, 27,  0, 0, pic.Width, pic.Height )		  icn.Graphics.DrawPicture( DVD32, 0, 0, 32, 32 )		  icn.Mask = DVD32Mask		  call ics.SetIconImage( icn, icn.Mask )		  		  // 16		  icn = new Picture( 16, 16, 32 )		  icn.Graphics.DrawPicture( pic, 3, 0, 10, 15,  0, 0, pic.Width, pic.Height )		  icn.Graphics.DrawPicture( DVD16, 0, 0, 16, 16 )		  icn.Mask = DVD16Mask		  call ics.SetIconImage( icn, icn.Mask )		  		  // Save to Folder		  ics.WriteFile( Iconfile )		  Iconfile.Visible = True		  Return Iconfile.AddCustomIconMBS( ics, false )		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub SmoothResize(w as window, width as integer, height as integer, align as integer)		  		  // Added 11/13/2001 by Jarvis Badgley		  // Edited 12/05/2001 by Jarvis Badgley		  // Modified 2/3/2002 by Kevin Ballard		  // ---		  // Rewritten 2/22/2002 by Kevin Ballard		  // Based off of code by Jean-Francois Roy <bahamut@mac.com>		  // ---		  // Modified 8/23/02 by Kevin Ballard		  // Modified 12/14/02 by Pedro fp <mail@pedro.net.au>		  // Modified 12/14/02 by Kevin Ballard		  //		  // Align numbers:		  //     0) Lock upper left		  //     1) Lock upper right		  //     2) Lock lower left		  //     3) Lock lower right		  //     4) Lock top center		  //     5) Lock left center		  //     6) Lock bottom center		  //     7) Lock right center		  		  		  #if targetmacos then		    dim err, t, l as integer		    dim rect as MemoryBlock		    		    #if TargetCarbon then		      Declare Function TransitionWindow Lib Carbon (window as WindowPtr, effect as Integer, action as Integer, rect as Ptr) as Integer		      Declare Function GetWindowBounds  Lib Carbon (window As WindowPtr, regionCode As Integer, globalBounds As Ptr) as Integer		    #else		      Declare Function TransitionWindow Lib "WindowsLib" (window as WindowPtr, effect as Integer, action as Integer, rect as Ptr) as Integer		      Declare Function GetWindowBounds  Lib "WindowsLib" (window As WindowPtr, regionCode As Integer, globalBounds As Ptr) as Integer		    #endif		    		    // we get the old window region		    rect = New MemoryBlock(8)		    err = GetWindowBounds(w, 32, rect)		    		    t = w.Top // Need to know where the top and left of the window go		    l = w.Left		    Select Case align // Use deltas in measurements, not absolutes		    Case 0 // Lock upper left		      rect.Short(4) = rect.Short(4) + (height - w.height)		      rect.Short(6) = rect.Short(6) + (width - w.width)		    Case 1 // Lock upper right		      rect.Short(2) = rect.Short(2) - (width - w.width)		      rect.Short(4) = rect.Short(4) + (height - w.height)		      l = l - (width - w.width) // Left side moves		    Case 2 // Lock lower left		      rect.Short(0) = rect.Short(0) - (height - w.height)		      rect.Short(6) = rect.Short(6) + (width - w.width)		      t = t - (height - w.height) // Top side moves		    Case 3 // Lock lower right		      rect.Short(0) = rect.Short(0) - (height - w.height)		      rect.Short(2) = rect.Short(2) - (width - w.width)		      t = t - (height - w.height) // Top side moves		      l = l - (width - w.width) // Left side moves		    Case 4 // Lock top center		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2		      rect.Short(4) = rect.Short(4) + (height - w.height)		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2		      l = l - (width - w.width)/2 // Both sides move		    Case 5 // Lock left center		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2		      rect.Short(6) = rect.Short(6) + (width - w.width)		      t = t - (height - w.height) / 2 // Top moves		    Case 6 // Lock bottom center		      rect.Short(0) = rect.Short(0) - (height - w.height)		      rect.Short(2) = rect.Short(2) - (width - w.width) / 2		      rect.Short(6) = rect.Short(6) + (width - w.width) / 2		      t = t - (height - w.height) // Top moves		      l = l - (width - w.width) / 2 // Left moves		    Case 7 // Lock right center		      rect.Short(0) = rect.Short(0) - (height - w.height) / 2		      rect.Short(2) = rect.Short(2) - (width - w.width)		      rect.Short(4) = rect.Short(4) + (height - w.height) / 2		      t = t - (height - w.height) / 2// Top moves		      l = l - (width - w.width) // Left moves		    End Select // If none of these, don't change		    		    // transition		    err = TransitionWindow(w, 3, 4, rect)		    		    // have to manually set the window's new height after resizing the window		    'w.Top = t		    'w.Left = l		    w.Width = width		    w.Height = height		    		    w.refresh		  #endif		  #if TargetWin32 then		    w.width=width		    w.height=height		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SocketError(Code As Integer, sckt as HTTPSocket)		  //HTTPSocket error codes and user notification		  Dim ErrorString As String		  ErrorString = "HTTP Error: " + str(code) + " occured." + chr(13) + chr(13)		  		  Select case code		  case 100		    ErrorString = ErrorString + "driver error"		  case 102		    ErrorString = ErrorString + "Connection Lost"		  case 103		    ErrorString = ErrorString + "Unresolved Host"		  case 105		    ErrorString = ErrorString + "Port Bind Error"		  case 106		    ErrorString = ErrorString + "Invalid Socket State"		  case 107		    ErrorString = ErrorString + "Invalid Port"		  case 108		    ErrorString = ErrorString + "Out Of Memory"		  case 400		    ErrorString = ErrorString + "Bad Request"		  case 401		    ErrorString = ErrorString + "Unauthorized"		  case 414		    ErrorString = ErrorString + "Request-URI Too Long"		  case 500		    ErrorString = ErrorString + "Internal Server Error"		  case 505		    ErrorString = ErrorString + "HTTP Version Not Supported"		  case 509		    ErrorString = ErrorString + "Bandwidth Limit Exceeded"		  else		    ErrorString = ErrorString + "Unknown or Undefined. Error Code"		  end Select		  		  wndProgress.Close		  MsgBox ErrorString		  		Exception err as NilObjectException		  sckt.Close		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SortFilesIntoFolders(FolderParent as FolderItem)		  Dim i As Integer		  Dim s, MovieTitle As String		  Dim FileLocation as FolderItem		  		  for i = 1 to FolderParent.Count		    		    'if NOT FolderParent.Item(i).Directory and FolderParent.Item(i).Visible and FolderParent.Item(i).Type = "video/any" then		    if FolderParent.Item(i).Type = "video/any" then		      FileLocation = FolderParent.Item(i)		      		      s = FileLocation.NameWithoutExtensionMBS		      s = s.ReplaceAll(".", " ")		      FolderParent.Child(s).CreateAsFolder		      		      FileLocation.MoveFileTo FolderParent.Child( s )		      		      MovieTitle = MovieAttr.MovieNameFilter( FolderParent.Child(s), True )		      if MovieTitle <> "" then FolderParent.Child(s).MoveFileTo( FolderParent.Child( MovieTitle ) )		    end if		    		  next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function String2Entities(s As String) As String		  s = s.ReplaceAll(" ", "+")		  s = s.ReplaceAll("&", "%26")		  		  return s		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub TestText(LargeText as String)		  wndTest.txtArea.Text = LargeText		  wndTest.Show		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function TidyXML(content as String) As String		  Dim tidy as new TidyDocumentMBS		  		  Tidy.OptionInCharEncoding = 4		  tidy.OptionXmlTags = true		  tidy.OptionWrapAttVals = false		  tidy.OptionWrapLen = 0		  tidy.OptionIndentSpaces = 2		  tidy.OptionIndentContent = 1		  tidy.OptionXmlOut = true		  		  tidy.OptionPreserveEntities = False		  		  call tidy.ParseString(content)		  call tidy.CleanAndRepair		  return tidy.SaveString		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function URL2Picture(URL As String, Unique as string, FiletypeExtension As String = "jpg", f As FolderItem = Nil) As Picture		  Dim sckt as new HTTPSocket		  Dim TheFile as FolderItem		  Dim FileSaved as Boolean		  		  sckt.Yield = true		  URL = String2Entities(URL)		  		  if f <> nil then		    TheFile = f.Child( Unique + "." + FiletypeExtension )		  Else		    TheFile = SpecialFolder.Temporary.Child( Unique + "." + FiletypeExtension )		  end if		  		  if TheFile <> nil and URL <> "" then		    		    if f <> nil and TheFile.Exists then		      // Don't want to overwrite or delete existing images.		      FileSaved = true		    else		      if TheFile.Exists then		        TheFile.Delete		        'TheFile.MoveFileTo( SpecialFolder.Trash )		      end if		      FileSaved = sckt.Get( URL, TheFile, Preferences.TimeOut )		      sckt.close		    end if		    		    if not FileSaved then  		      Dim FileSystemErrorCode as Integer = sckt.LastErrorCode		      if TheFile.Exists then TheFile.Delete // Don't leave partially downloaded files.		      sckt.Close		      ' MsgBox "Error: " + Str(FileSystemErrorCode) + Chr(13) + Chr(13) + "Connection timed out, please try again later."		      Return nil		    else		      'TheFile.parent.launch		      sckt.Close		      Return Picture.Open( TheFile )		    end if		    		  end if		End Function	#tag EndMethod	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule