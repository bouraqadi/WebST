Class {
	#name : #WsComponentBridgeClient,
	#superclass : #PjBrowserBridgeClient,
	#category : #'WebSt-Base-Apps'
}

{ #category : #accessing }
WsComponentBridgeClient >> initializeWithBridge: aBrdige [

	super initializeWithBridge: aBrdige.
	self server html: appClass html
]
