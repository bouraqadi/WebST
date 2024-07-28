"
Export both JS and HTML files
"
Class {
	#name : 'WsExporter',
	#superclass : 'Object',
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'exporting' }
WsExporter class >> exportApp: aClass [ 
	^self new
		exportApp: aClass;
		yourself
]

{ #category : 'exporting' }
WsExporter >> exportApp: aClass [
	self subclassResponsibility 
]
