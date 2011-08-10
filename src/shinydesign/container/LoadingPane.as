package shinydesign.container
{
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	[SkinState("loading")]
	[SkinState("dataLoaded")]
	public class LoadingPane extends SkinnableContainer
	{
		
		[SkinPart(required="false")]
		public var LoadingLabel:Label;
		
		private var _loading:Boolean; //Skin State flag
		private var _dataLoaded:Boolean; //Skin State Flag
		private var _loadingTitle:String;  //Optional loading title


		public function get loadingTitle():String
		{
			return _loadingTitle;
		}

		public function set loadingTitle(value:String):void
		{
			_loadingTitle = value;
		}


		public function get loading():Boolean
		{
			return _loading;
		}

		public function set loading(value:Boolean):void
		{
			if(_loading !=value){
				_loading=value;
				_dataLoaded=false;
				invalidateSkinState();
			}
		}

		public function get dataLoaded():Boolean
		{
			return _dataLoaded;
		}

		public function set dataLoaded(value:Boolean):void
		{
			if (_dataLoaded != value) {
				_dataLoaded = value;
				_loading=false;
				invalidateSkinState();
			}
		}
		
		//If we currently loading then return this flag
		override protected function getCurrentSkinState():String {
			if(dataLoaded)
				return 'dataLoaded';
			if(loading)
				return 'loading';
			
			return super.getCurrentSkinState();
			
		}
		
		//Add the loading text if the label is being added to the skin
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if (instance == LoadingLabel) {
				LoadingLabel.text=loadingTitle;
			}
		}
	
		public function LoadingPane()
		{
			super();
		}
	}
}