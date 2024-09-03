Class {
	#name : 'WsEventTestingComponent',
	#superclass : 'WsMinimalComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'isConnectionToDomCaptured'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'initialization' }
WsEventTestingComponent >> initView [

	super initView.
	isConnectionToDomCaptured := false.
	self whenConnectedToDomDo: [ isConnectionToDomCaptured := true ]
]

{ #category : 'accessing' }
WsEventTestingComponent >> isConnectionToDomCaptured [

	^ isConnectionToDomCaptured
]
