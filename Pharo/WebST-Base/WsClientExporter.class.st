Class {
	#name : 'WsClientExporter',
	#superclass : 'WsExporter',
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'exporting' }
WsClientExporter >> exportApp: aClass [

	self jsExporter exportApp: aClass.
	self htmlExporter exportApp: aClass
]

{ #category : 'accessing' }
WsClientExporter >> htmlExporter [

	^ WsHtmlExporter
]

{ #category : 'accessing' }
WsClientExporter >> jsExporter [ 
	^PjFileExporter 
]
