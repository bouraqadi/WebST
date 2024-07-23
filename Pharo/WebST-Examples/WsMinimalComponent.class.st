Class {
	#name : 'WsMinimalComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-Misc',
	#package : 'WebST-Examples',
	#tag : 'Misc'
}

{ #category : 'class initialization' }
WsMinimalComponent class >> tagName [ 
	^'ws-minimal'
]

{ #category : 'accessing' }
WsMinimalComponent class >> viewClass [

	<pharoJsSkip>
	^ WsMinimalView
]
