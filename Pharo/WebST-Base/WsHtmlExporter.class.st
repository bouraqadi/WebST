Class {
	#name : 'WsHtmlExporter',
	#superclass : 'WsExporter',
	#instVars : [
		'appClass'
	],
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'instance creation' }
WsHtmlExporter class >> newWithAppClass: aClass [ 
	^self new
		initializeWithAppClass: aClass;
		yourself
]

{ #category : 'exporting' }
WsHtmlExporter >> exportApp: aClass [

	self initializeWithAppClass: aClass.
	self writeFiles 
]

{ #category : 'initialization' }
WsHtmlExporter >> initializeWithAppClass: aClass [
	appClass := aClass 
]

{ #category : 'exporting' }
WsHtmlExporter >> writeFiles [
	appClass appFullHtmlFileName ensureDelete.
	appClass appFullHtmlFileName writeStreamDo: [ :stream |
		stream << appClass html ]
]
