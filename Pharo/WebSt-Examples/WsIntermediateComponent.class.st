Class {
	#name : #WsIntermediateComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebSt-Examples-CompositeComponents'
}

{ #category : #'class initialization' }
WsIntermediateComponent class >> tagName [

	^'ws-intermediate'
]

{ #category : #accessing }
WsIntermediateComponent class >> viewClass [

	<pharoJsSkip>
	^WsIntermediateComponentView 
]
