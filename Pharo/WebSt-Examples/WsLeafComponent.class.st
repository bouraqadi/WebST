Class {
	#name : #WsLeafComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebSt-Examples-CompositeComponents'
}

{ #category : #'class initialization' }
WsLeafComponent class >> tagName [

	^'ws-leaf'
]

{ #category : #accessing }
WsLeafComponent class >> viewClass [

	<pharoJsSkip>
	^WsLeafComponentView 
]
