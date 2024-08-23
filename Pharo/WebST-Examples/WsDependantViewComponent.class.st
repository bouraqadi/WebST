Class {
	#name : 'WsDependantViewComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-DependantViews',
	#package : 'WebST-Examples',
	#tag : 'DependantViews'
}

{ #category : 'accessing' }
WsDependantViewComponent class >> viewClass [

	<pharoJsSkip>
	^ WsDependantView 
]
