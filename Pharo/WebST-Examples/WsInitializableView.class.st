Class {
	#name : 'WsInitializableView',
	#superclass : 'WsView',
	#instVars : [
		'textContent'
	],
	#category : 'WebST-Examples-ViewCustomization',
	#package : 'WebST-Examples',
	#tag : 'ViewCustomization'
}

{ #category : 'accessing' }
WsInitializableView >> randomText [

	^ String streamContents: [: str |
		str << 'Random text generated on ';
		print: DateAndTime now]
]

{ #category : 'rendering' }
WsInitializableView >> renderOuterHtmlOn: html [

	html paragraph with:  self textContent
]

{ #category : 'accessing' }
WsInitializableView >> textContent [

	^ textContent ifNil: [ self randomText ]
]

{ #category : 'accessing' }
WsInitializableView >> textContent: anObject [

	textContent := anObject
]
