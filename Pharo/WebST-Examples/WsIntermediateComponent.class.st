Class {
	#name : 'WsIntermediateComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'class initialization' }
WsIntermediateComponent class >> tagName [

	^'ws-intermediate'
]

{ #category : 'accessing' }
WsIntermediateComponent class >> viewClass [

	<pharoJsSkip>
	^WsIntermediateComponentView 
]
