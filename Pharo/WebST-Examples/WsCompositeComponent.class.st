Class {
	#name : #WsCompositeComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebST-Examples-CompositeComponents'
}

{ #category : #'class initialization' }
WsCompositeComponent class >> tagName [

	^'ws-composite'
]

{ #category : #accessing }
WsCompositeComponent class >> viewClass [

	<pharoJsSkip>
	^WsCompositeComponentView 
]
