Class {
	#name : #WsComponentBridgeClient,
	#superclass : #PjBrowserBridgeClient,
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsComponentBridgeClient >> initializeWithBridge: aBrdige [

	super initializeWithBridge: aBrdige.
	self server html: appClass html
]
