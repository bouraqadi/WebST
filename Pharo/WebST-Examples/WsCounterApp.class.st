Class {
	#name : #WsCounterApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTComponentApp',
	#classTraits : 'WsTComponentApp classTrait',
	#category : #'WebST-Examples-Basic'
}

{ #category : #accessing }
WsCounterApp class >> rootComponentClass [

	^ WsCounterComponent
]
