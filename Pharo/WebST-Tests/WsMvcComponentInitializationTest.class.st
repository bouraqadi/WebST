Class {
	#name : #WsMvcComponentInitializationTest,
	#superclass : #WsMvcComponentTest,
	#category : #'WebST-Tests-Support'
}

{ #category : #accessing }
WsMvcComponentInitializationTest class >> componentClass [

	^ WsInitializationCounterForTest 
]
