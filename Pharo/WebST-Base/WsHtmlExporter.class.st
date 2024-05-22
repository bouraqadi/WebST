Class {
	#name : #WsHtmlExporter,
	#superclass : #WsExporter,
	#category : #'WebST-Base-Apps'
}

{ #category : #exporting }
WsHtmlExporter >> exportApp: appClass [

	appClass appFullHtmlFileName ensureDelete.
	appClass appFullHtmlFileName writeStreamDo: [: stream | 
		stream << appClass html].
	
]
