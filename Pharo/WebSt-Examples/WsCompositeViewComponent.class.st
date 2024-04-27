Class {
	#name : #WsCompositeViewComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebSt-Examples-CompositeViews'
}

{ #category : #'class initialization' }
WsCompositeViewComponent class >> tagName [

	^'ws-abcd'
]

{ #category : #accessing }
WsCompositeViewComponent class >> viewClass [

	<pharoJsSkip>
	^WsCompositeView 
]
