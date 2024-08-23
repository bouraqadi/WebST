Class {
	#name : 'WsLeafComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'accessing' }
WsLeafComponent class >> viewClass [

	<pharoJsSkip>
	^WsLeafComponentView 
]
