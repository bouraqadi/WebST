"
Placeholder for JS class HTMLElement. See class-side method #javascriptName

"
Class {
	#name : 'WsHtmlElement',
	#superclass : 'WsNode',
	#instVars : [
		'style',
		'preConnectInitializePort',
		'postConnectInitializePort'
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

{ #category : 'accessing attributes' }
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

{ #category : 'accessing attributes' }
WsHtmlElement >> hasDataAttributeAt: jsAttributeName [ 

	^self ifDataAttribute: jsAttributeName present: [true] absent: [ false ].

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

{ #category : 'accessing attributes' }
WsHtmlElement >> ifDataAttribute: jsAttributeName absent: handleAttributeMissingBlock [

	^self 
		ifDataAttribute: jsAttributeName 
		present: [ : attributeValue | attributeValue ] 
		absent: handleAttributeMissingBlock

]

{ #category : 'accessing attributes' }
WsHtmlElement >> ifDataAttribute: jsAttributeName present: useAttribteValueBlock [

	^self ifDataAttribute: jsAttributeName present: useAttribteValueBlock absent: nil
]

{ #category : 'accessing attributes' }
WsHtmlElement >> ifDataAttribute: jsAttributeName present: useAttribteValueBlock absent: handleAttributeMissingBlock [
	| attributeValue |
	attributeValue := self dataAttributeAt: jsAttributeName ifAbsent: [ ^handleAttributeMissingBlock value ].
	^useAttribteValueBlock cull: attributeValue
	
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

{ #category : 'observing lifecycle' }
WsHtmlElement >> isReady [
	^false
]

{ #category : 'accessing visibility' }
WsHtmlElement >> isShowing [
	^self isHidden not
	
]

{ #category : 'observing lifecycle' }
WsHtmlElement >> isStarted [
	^false
]

{ #category : 'observing lifecycle' }
WsHtmlElement >> onReadyDo: aBlock [
	"Request to perform aBlock when component finished preConnectinitialize"
	"We put it here, since web browsers when encoutring a custom tag not registred, creates a instance of HTMLElement.
	The HTMLElements are migrated to become instances of the appropraite component class, when the missing component class is loaded and registred, i.e. linked to the custom tag"
	
"	self preConnectInitializePort => aBlock.
	self isPreConnectInitializeDone ifTrue: [ ^aBlock cull: self ].
"
]

{ #category : 'observing lifecycle' }
WsHtmlElement >> onStartedDo: aBlock [
	"Request to perform aBlock when component finished postConnectInitialize"
	"We put it here, since web browsers when encoutring a custom tag not registred, creates a instance of HTMLElement.
	The HTMLElements are migrated to become instances of the appropraite component class, when the missing component class is loaded and registred, i.e. linked to the custom tag"
	
"	self postConnectInitializePort => aBlock.
	self isPostConnectInitializeDone ifTrue: [ aBlock cull: self ].
"
]

{ #category : 'observing lifecycle' }
WsHtmlElement >> postConnectInitializePort [
	"^postConnectInitializePort ifNil: [ postConnectInitializePort := HyCollectionPort notificationSelector: #cull: ]"
]

{ #category : 'observing lifecycle' }
WsHtmlElement >> preConnectInitializePort [
	"^preConnectInitializePort ifNil: [ preConnectInitializePort := HyCollectionPort notificationSelector: #cull: ]"
]

{ #category : 'converting' }
WsHtmlElement >> pxFromInt: anInteger [

	^ anInteger asString, 'px'
]

{ #category : 'accessing attributes' }
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
