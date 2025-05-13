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

{ #category : 'instance creation' }
WsActionTriggeringAndCondition class >> whenTrueDo: aBlock [
	^self new
		whenTrueDo: aBlock;
		yourself
]

{ #category : 'variables' }
WsActionTriggeringAndCondition >> attemptAction [

	self ifTrueDo: actionBlock
]

{ #category : 'updating' }
WsActionTriggeringAndCondition >> update [
	self attemptAction 
]

{ #category : 'enumerating' }
WsActionTriggeringAndCondition >> whenTrueDo: aBlock [

	actionBlock := aBlock.
	self attemptAction
]
