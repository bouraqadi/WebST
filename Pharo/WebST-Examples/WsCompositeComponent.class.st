Class {
	#name : 'WsCompositeComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'accessing' }
WsCompositeComponent class >> viewClass [

	<pharoJsSkip>
	^WsCompositeComponentView 
]
