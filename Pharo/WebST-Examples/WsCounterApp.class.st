Class {
	#name : #WsCounterApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTSingleComponentApp',
	#classTraits : 'WsTSingleComponentApp classTrait',
	#category : #'WebST-Examples-Basic'
}

{ #category : #accessing }
WsCounterApp class >> rootComponentClass [

	^ WsCounterComponent
]
