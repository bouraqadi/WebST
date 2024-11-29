"
Placeholder for JS class HTMLElement. See class-side method #javascriptName

"
Class {
	#name : 'WsHtmlElement',
	#superclass : 'WsNode',
	#instVars : [
		'style'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'pharoJs support' }
WsHtmlElement class >> javascriptName [

	<pharoJsSkip>
	^ #HTMLElement
]

{ #category : 'accessing visibility' }
WsHtmlElement >> computedDisplayStyle [
	^self computedStyle display 
]

{ #category : 'accessing size' }
WsHtmlElement >> computedHeight [

	^ self intFromPx: self computedHeightPx
]

{ #category : 'accessing size' }
WsHtmlElement >> computedHeightPx [

	^ self computedStyle height
]

{ #category : 'accessing' }
WsHtmlElement >> computedStyle [
	^window getComputedStyle: self
]

{ #category : 'accessing size' }
WsHtmlElement >> computedWidth [

	^ self intFromPx: self computedWidthPx
]

{ #category : 'accessing size' }
WsHtmlElement >> computedWidthPx [

	^ self computedStyle width
]

{ #category : 'accessing position' }
WsHtmlElement >> computedX [

	^ self intFromPx: self computedXPx
]

{ #category : 'accessing position' }
WsHtmlElement >> computedXPx [

	^ self computedStyle left
]

{ #category : 'accessing position' }
WsHtmlElement >> computedY [

	^ self intFromPx: self computedYPx
]

{ #category : 'accessing position' }
WsHtmlElement >> computedYPx [

	^ self computedStyle top
]

{ #category : 'accessing  zIndex' }
WsHtmlElement >> computedZIndex [

	| zIndexString |
	zIndexString := self computedStyle zIndex.
	zIndexString ifEmpty: [ ^ 0 ].
	zIndexString first isDigit ifFalse: [ ^ 0 ].
	^ zIndexString asNumber
]

{ #category : 'accessing' }
WsHtmlElement >> dataAttributeAt: jsAttributeName ifAbsent: aBlock [

	"Read attributes defined in html. JS attribute name is camel case.
	https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dataset"
	^ self dataset at: jsAttributeName ifAbsent: aBlock
]

{ #category : 'accessing size' }
WsHtmlElement >> defaultHeight [

	^ self computedHeight
]

{ #category : 'accessing size' }
WsHtmlElement >> defaultWidth [

	^ self computedWidth 
]

{ #category : 'accessing position' }
WsHtmlElement >> defaultX [

	^ self computedX
]

{ #category : 'accessing position' }
WsHtmlElement >> defaultY [

	^ self computedY
]

{ #category : 'accessing  zIndex' }
WsHtmlElement >> defaultZIndex [
	^self computedZIndex
]

{ #category : 'accessing visibility' }
WsHtmlElement >> displayStyle: value flag: flag [

	style setProperty: 'display' value: value flag: flag
]

{ #category : 'accessing' }
WsHtmlElement >> hasDataAttributeAt: jsAttributeName [ 

	self dataAttributeAt: jsAttributeName ifAbsent: [ ^false ].
	^true
]

{ #category : 'accessing size' }
WsHtmlElement >> height [

	self heightPx ifEmpty: [ ^self defaultHeight ].
	^ self intFromPx: self heightPx
]

{ #category : 'accessing size' }
WsHtmlElement >> height: anInteger [

	^ style height: (self pxFromInt: anInteger)
]

{ #category : 'accessing size' }
WsHtmlElement >> heightPx [

	^ style height
]

{ #category : 'accessing visibility' }
WsHtmlElement >> hide [

	self displayStyle: 'none' flag: 'important'
]

{ #category : 'converting' }
WsHtmlElement >> intFromPx: aString [
	aString ifEmpty: [ ^0 ].
	^aString asInteger 
]

{ #category : 'accessing visibility' }
WsHtmlElement >> isHidden [

	^ self computedDisplayStyle  = 'none'
]

{ #category : 'accessing visibility' }
WsHtmlElement >> isShowing [
	^self isHidden not
	
]

{ #category : 'converting' }
WsHtmlElement >> pxFromInt: anInteger [

	^ anInteger asString, 'px'
]

{ #category : 'accessing' }
WsHtmlElement >> setStyleProperty: propertyName value: value flag: falg [
	style setProperty: propertyName value: value flag: falg
]

{ #category : 'accessing visibility' }
WsHtmlElement >> show [

	self displayStyle: '' flag: ''
]

{ #category : 'accessing size' }
WsHtmlElement >> width [

	self widthPx ifEmpty: [ ^self defaultWidth ].
	^ self intFromPx: self widthPx
]

{ #category : 'accessing size' }
WsHtmlElement >> width: anInteger [

	^style width: (self pxFromInt: anInteger)
]

{ #category : 'accessing size' }
WsHtmlElement >> widthPx [

	^ style width
]

{ #category : 'accessing position' }
WsHtmlElement >> x [

	self xPx ifEmpty: [ ^self defaultX ].
	^ self intFromPx: self xPx
]

{ #category : 'accessing position' }
WsHtmlElement >> x: anInteger [

	^ style left: (self pxFromInt: anInteger)
]

{ #category : 'accessing position' }
WsHtmlElement >> xPx [

	^ style left
]

{ #category : 'accessing position' }
WsHtmlElement >> y [

	self yPx ifEmpty: [ ^ self defaultY].
	^ self intFromPx: self yPx
]

{ #category : 'accessing position' }
WsHtmlElement >> y: anInteger [

	^ style top: (self pxFromInt: anInteger)
]

{ #category : 'accessing position' }
WsHtmlElement >> yPx [

	^ style top
]

{ #category : 'accessing  zIndex' }
WsHtmlElement >> zIndex [

	style zIndex ifEmpty: [ ^ self defaultZIndex ].
	^ style zIndex asInteger
]

{ #category : 'accessing  zIndex' }
WsHtmlElement >> zIndex: newZIndex [

	style zIndex: newZIndex
]
