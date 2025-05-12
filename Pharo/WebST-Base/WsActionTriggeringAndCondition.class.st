Class {
	#name : 'WsActionTriggeringAndCondition',
	#superclass : 'WsAndCondition',
	#instVars : [
		'actionBlock'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'elements' }
WsActionTriggeringAndCondition >> attemptAction [

	self ifTrueDo: actionBlock
]

{ #category : 'elements' }
WsActionTriggeringAndCondition >> setTrue: key [

	super setTrue: key.
	self attemptAction
]

{ #category : 'enumerating' }
WsActionTriggeringAndCondition >> whenTrueDo: aBlock [

	actionBlock := aBlock.
	self attemptAction
]
