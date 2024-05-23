Class {
	#name : #WsClientExporter,
	#superclass : #WsExporter,
	#category : #'WebST-Base-Apps'
}

{ #category : #exporting }
WsClientExporter >> exportApp: aClass [

	self jsExporter exportApp: aClass.
	self htmlExporter exportApp: aClass
]

{ #category : #accessing }
WsClientExporter >> htmlExporter [

	^ WsHtmlExporter
]

{ #category : #accessing }
WsClientExporter >> jsExporter [ 
	^PjFileExporter 
]
