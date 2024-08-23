Class {
	#name : 'WsCompositeViewComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'accessing' }
WsCompositeViewComponent class >> viewClass [

	<pharoJsSkip>
	^WsCompositeView 
]
