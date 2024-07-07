Class {
	#name : #WsScoreComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebST-Examples-Misc'
}

{ #category : #'class initialization' }
WsScoreComponent class >> tagName [

	^'ws-score'
]

{ #category : #accessing }
WsScoreComponent class >> viewClass [

	<pharoJsSkip>
	^WsScoreView 
]
