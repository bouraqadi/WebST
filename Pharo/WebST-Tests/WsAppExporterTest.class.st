Class {
	#name : #WsAppExporterTest,
	#superclass : #TestCase,
	#category : #'WebST-Tests-Support'
}

{ #category : #accessing }
WsAppExporterTest >> appClass [

	^ WsToDoListApp
]

{ #category : #accessing }
WsAppExporterTest >> htmlFile [

	^ self appClass appFullHtmlFileName
]

{ #category : #accessing }
WsAppExporterTest >> jsFile [

	^ self appClass appFullJsFileName 
]

{ #category : #running }
WsAppExporterTest >> setUp [
	super setUp.
	self jsFile ensureDelete.
	self htmlFile ensureDelete
]

{ #category : #tests }
WsAppExporterTest >> testHtmlAndJsFilesExport [

	self deny: self jsFile exists.
	self deny: self htmlFile exists.
	self appClass exportApp.
	self assert: self jsFile exists.
	self assert: self htmlFile exists
]
