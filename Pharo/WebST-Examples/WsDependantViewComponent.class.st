Class {
	#name : 'WsDependantViewComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-DependantViews',
	#package : 'WebST-Examples',
	#tag : 'DependantViews'
}

{ #category : 'class initialization' }
WsDependantViewComponent class >> tagName [

	^ 'ws-dependant-view'
]

{ #category : 'accessing' }
WsDependantViewComponent class >> viewClass [

	<pharoJsSkip>
	^ WsDependantView 
]
