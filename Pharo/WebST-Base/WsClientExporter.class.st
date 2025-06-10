Class {
	#name : 'WsClientExporter',
	#superclass : 'WsExporter',
	#instVars : [
		'jsExporter',
		'htmlExporter'
	],
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'loading' }
WsClientExporter >> convertAllClassesToJs: aCollection [ 
	^jsExporter convertAllClassesToJs: aCollection 
]

{ #category : 'transpiling' }
WsClientExporter >> convertToJs: aPjJavascriptMessage [ 
	^jsExporter convertToJs: aPjJavascriptMessage
]

{ #category : 'exporting' }
WsClientExporter >> exportApp: aClass [

	self initializeWithAppClass: aClass.
	self writeFiles
]

{ #category : 'initialization' }
WsClientExporter >> htmlExporterClass [

	^ WsHtmlExporter
]

{ #category : 'initialization' }
WsClientExporter >> initializeWithAppClass: aClass [

	jsExporter := self jsExporterClass newWithAppClass: aClass.
	htmlExporter := self htmlExporterClass newWithAppClass: aClass.

]

{ #category : 'initialization' }
WsClientExporter >> jsExporterClass [ 
	^PjFileExporter 
]

{ #category : 'initialization' }
WsClientExporter >> resetTranspiler [
	jsExporter resetTranspiler 
]

{ #category : 'accessing' }
WsClientExporter >> transpiler [

	^jsExporter transpiler
]

{ #category : 'writing' }
WsClientExporter >> writeFiles [

	jsExporter writeFiles.
	htmlExporter writeFiles
]

{ #category : 'writing' }
WsClientExporter >> writeJsCodeOn: aWriteStream [ 
	jsExporter writeJsCodeOn: aWriteStream 
]
