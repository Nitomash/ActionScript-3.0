package  {
	
	import flash.display.SimpleButton;
	
	
	public class Converce extends SimpleButton 
	{
		public function edit(text:String):String
		{
			
			var hrIndex = 0, colorIndex = 0, sizeIndex = 0, fontIndex = 0;
			var s:String = new String();
			var sLower:String = new String();
			var change:Boolean = new Boolean();
			
			while(1)
			{
				change = false;
				s = text;
				
				s = s.replace("[C]", "[center]");
				s = s.replace("[/C]", "[/center]");
				s = s.replace("[c]", "[center]");
				s = s.replace("[/c]", "[/center]");
				
				s = s.replace("[R]", "[right]");
				s = s.replace("[/R]", "[/right]");
				s = s.replace("[r]", "[right]");
				s = s.replace("[/r]", "[/right]");
				
				s = s.replace("[L]", "[left]");
				s = s.replace("[/L]", "[/left]");
				s = s.replace("[l]", "[left]");
				s = s.replace("[/l]", "[/left]");
				
				s = s.replace("[J]", "");
				s = s.replace("[/J]", "");
				s = s.replace("[j]", "");
				s = s.replace("[/j]", "");
				
				if (s != text)
					change = true;
				
				sLower = s.toLocaleLowerCase();
				
				if (sLower.indexOf("[hr]", hrIndex) != sLower.indexOf("[hr]hr[/hr]", hrIndex))
				{
					trace(sLower.indexOf("[hr]", hrIndex));
					trace(s.charAt(sLower.indexOf("[hr]", hrIndex)) + s.charAt(sLower.indexOf("[hr]", hrIndex) + 1) + s.charAt(sLower.indexOf("[hr]", hrIndex) + 2) + s.charAt(sLower.indexOf("[hr]", hrIndex) + 3));
					s = s.substr(0, sLower.indexOf("[hr]", hrIndex)) + "[hr]hr[/hr]" + s.substr(sLower.indexOf("[hr]", hrIndex) + 4);
					hrIndex = s.indexOf("[hr]", hrIndex) + 12;
					change = true;
				}
				
				sLower = s.toLocaleLowerCase();
				
				if (sLower.indexOf("[color=", colorIndex) != -1)
				{
					if (sLower.indexOf("[color=", colorIndex) != sLower.indexOf("[color=#", colorIndex))
					{
						s = editColor(s, sLower.indexOf("[color=", colorIndex));
						colorIndex = sLower.indexOf("[color=", colorIndex) + 7;
					}
					else
						colorIndex = sLower.indexOf("[color=", colorIndex) + 7;
					
					change = true;
				}
				
				sLower = s.toLocaleLowerCase();
				
				if (sLower.indexOf("[size=", sizeIndex) != -1)
				{
					var cellIndex = sLower.indexOf("[size=", sizeIndex) + 6;
					var cell = s.charAt(sLower.indexOf("[size=", sizeIndex) + 6);
					if (s.charAt(sLower.indexOf("[size=", sizeIndex) + 7) != "]")
						cell = cell + s.charAt(sLower.indexOf("[size=", sizeIndex) + 7);
					switch(cell)
					{
						case "1":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "2":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "3":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "4":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "5":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "6":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "7":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "8":
							s = s.substr(0, cellIndex) + "1" + s.substr(cellIndex + 1);
						break;
						case "9":
							s = s.substr(0, cellIndex) + "2" + s.substr(cellIndex + 1);
						break;
						case "10":
							s = s.substr(0, cellIndex) + "3" + s.substr(cellIndex + 2);
						break;
						case "11":
							s = s.substr(0, cellIndex) + "4" + s.substr(cellIndex + 2);
						break;
						case "12":
							s = s.substr(0, cellIndex) + "5" + s.substr(cellIndex + 2);
						break;
						case "13":
							s = s.substr(0, cellIndex) + "6" + s.substr(cellIndex + 2);
						break;
						default:
							s = s.substr(0, cellIndex) + "7" + s.substr(cellIndex + 2);
						break;
					}
					sizeIndex = sLower.indexOf("[size=", sizeIndex) + 13;
					change = true;
				}
				
				sLower = s.toLocaleLowerCase();
				
				if (sLower.indexOf("[font=", fontIndex) != -1)
				{
					if (sLower.indexOf("[font=", fontIndex) == sLower.indexOf("[font=proxima_nova_ltlight", fontIndex))
					{
						s = s.substr(0, sLower.indexOf("[font=", fontIndex) + 6) + "Arial" + s.substr(sLower.indexOf("[font=", fontIndex) + 26);
						fontIndex = sLower.indexOf("[font=", fontIndex) + 26;
					}
					if (sLower.indexOf("[font=", fontIndex) == sLower.indexOf("[font=times", fontIndex) && sLower.indexOf("[font=", fontIndex) != sLower.indexOf("[font=times new roman", fontIndex))
					{
						s = s.substr(0, sLower.indexOf("[font=", fontIndex) + 6) + "Times New Roman" + s.substr(sLower.indexOf("[font=", fontIndex) + 11);
						fontIndex = sLower.indexOf("[font=", fontIndex) + 11;
					}
					
					fontIndex = sLower.indexOf("[font=", fontIndex) + 6;
					change = true;
				}
				
				s = s.replace("[/video]", "[/media]");
				s = s.replace("[video]https://www.youtube.com/watch?v=", "[media=youtube]");
				s = s.replace("[VIDEO]https://www.youtube.com/watch?v=", "[media=youtube]");
				s = s.replace("[video]http://www.youtube.com/watch?v=", "[media=youtube]");
				s = s.replace("[VIDEO]http://www.youtube.com/watch?v=", "[media=youtube]");
				
				if (s != text)
					change = true;
				
				if (!change)
					break;
				
				text = s;
			}
			
			return text;
		}
		
		internal function editColor(text:String, n):String
		{
			var i;
			var s:String = text.toLowerCase();
			n = n + 7;
			if (s.indexOf("]", n) != n + 6)
				return text;
			else
			{
				s = s.substr(n, 6);
				
				for (i = 0 ; i < 6 ; ++i)
				{
					switch(s.charAt(i))
					{
						case "a":
							i = i;
						break;
						case "b":
							i = i;
						break;
						case "c":
							i = i;
						break;
						case "d":
							i = i;
						break;
						case "e":
							i = i;
						break;
						case "f":
							i = i;
						break;
						case "0":
							i = i;
						break;
						case "1":
							i = i;
						break;
						case "2":
							i = i;
						break;
						case "3":
							i = i;
						break;
						case "4":
							i = i;
						break;
						case "5":
							i = i;
						break;
						case "6":
							i = i;
						break;
						case "7":
							i = i;
						break;
						case "8":
							i = i;
						break;
						case "9":
							i = i;
						break;
						default:
							i = 100;
						break;
					}
					
					if (i == 100)
						return text;
				}
				
				text = text.substr(0, n) + "#" + text.substr(n);
				
				return text;
			}
		}
	}
	
}
