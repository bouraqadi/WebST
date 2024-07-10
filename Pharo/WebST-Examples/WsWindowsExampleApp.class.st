Class {
	#name : #WsWindowsExampleApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTViewBasedApp',
	#classTraits : 'WsTViewBasedApp classTrait',
	#category : #'WebST-Examples-Misc'
}

{ #category : #accessing }
WsWindowsExampleApp class >> viewClass [

	<pharoJsSkip>
	^WsWindowsExampleView 
]
