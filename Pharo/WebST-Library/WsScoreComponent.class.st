Class {
	#name : 'WsScoreComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Library-Counter',
	#package : 'WebST-Library',
	#tag : 'Counter'
}

{ #category : 'class initialization' }
WsScoreComponent class >> tagName [

	^'ws-score'
]

{ #category : 'accessing' }
WsScoreComponent class >> viewClass [

	<pharoJsSkip>
	^WsScoreView 
]
