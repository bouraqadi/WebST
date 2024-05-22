Class {
	#name : #WsAppExporter,
	#superclass : #WsExporter,
	#category : #'WebST-Base-Apps'
}

{ #category : #exporting }
WsAppExporter >> exportApp: aClass [

	self jsExporter exportApp: aClass.
	self htmlExporter exportApp: aClass
]

{ #category : #accessing }
WsAppExporter >> htmlExporter [

	^ WsHtmlExporter
]

{ #category : #accessing }
WsAppExporter >> jsExporter [ 
	^PjFileExporter 
]
