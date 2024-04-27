Class {
	#name : #WsLeafComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebST-Examples-CompositeComponents'
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
