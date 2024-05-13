Class {
	#name : #WsRenderer,
	#superclass : #WAHtmlCanvas,
	#instVars : [
		'stream',
		'document',
		'localResources',
		'globalResources'
	],
	#category : #'WebST-Base-Views'
}

{ #category : #rendering }
WsRenderer class >> htmlFrom: anObject [

	^ self new htmlFrom: anObject
]

{ #category : #rendering }
WsRenderer class >> htmlWithLocalResourcesFrom: anObject [

	| basicRenderer |
	basicRenderer := self render: anObject.
	^ self new
		  render: basicRenderer localResources;
		  html: basicRenderer html;
		  html
]

{ #category : #rendering }
WsRenderer class >> render: anObject [

	^ self new render: anObject; yourself
]

{ #category : #accessing }
WsRenderer >> addAllResources: resources [

	resources do: [ :each | self addResource: each ]
]

{ #category : #accessing }
WsRenderer >> addAllResourcesOf: element [

	element resources do: [ :each | self addResource: each ]
]

{ #category : #accessing }
WsRenderer >> addGlobalResource: resource [

(self globalResources includes: resource) ifTrue: [ ^self ].
	self globalResources add: resource
]

{ #category : #accessing }
WsRenderer >> addLocalResource: resource [

(self localResources includes: resource) ifTrue: [ ^self ].
	localResources add: resource
]

{ #category : #accessing }
WsRenderer >> addResource: resource [
	resource addTo: self
]

{ #category : #accessing }
WsRenderer >> document [
	^document 
]

{ #category : #accessing }
WsRenderer >> globalResources [
	^globalResources
]

{ #category : #accessing }
WsRenderer >> html [

	self flush.
	^ stream contents
]

{ #category : #rendering }
WsRenderer >> htmlFrom: anObject [

	self render: anObject.
	^self html
]

{ #category : #rendering }
WsRenderer >> icon [

	^ self tag: 'i'
]

{ #category : #initialization }
WsRenderer >> initialize [

	super initialize.
	stream := WriteStream on: String new.
	document := WAHtmlDocument on: stream.
	"OrderedCollections are needed to ensure definition order which might be related to some implicit dependencies"
	self resetLocalResources.
	globalResources := OrderedCollection new
]

{ #category : #rendering }
WsRenderer >> link [

	^ self brush: WsLinkTag new
]

{ #category : #accessing }
WsRenderer >> localResources [

	^ localResources
]

{ #category : #rendering }
WsRenderer >> render: element [

	element renderOn: self
]

{ #category : #rendering }
WsRenderer >> render: element style: cssStyleString [

	element renderOn: self  style: cssStyleString
]

{ #category : #rendering }
WsRenderer >> renderAppClass: appClass [

	| componentRenderer page |
	componentRenderer := self species new.
	componentRenderer render: appClass rootComponentClass.
	page := WsPage new.
	page title: appClass title.
	page addResourcesAll: componentRenderer globalResources.
	page addViewHtml: componentRenderer html.
	page addJsAt: appClass appJsFileName.
	self render: page
]

{ #category : #rendering }
WsRenderer >> renderComponentClass: component [

	| currentLocalResources |
	currentLocalResources := localResources.
	self resetLocalResources.
	self addAllResourcesOf: component.
	component renderOuterHtmlOn: self.
	localResources := currentLocalResources
]

{ #category : #rendering }
WsRenderer >> renderComponentClass: component style: cssStyleString [

	| currentLocalResources |
	currentLocalResources := localResources.
	self resetLocalResources.
	self addAllResourcesOf: component.
	component renderOuterHtmlOn: self style: cssStyleString.
	localResources := currentLocalResources
]

{ #category : #rendering }
WsRenderer >> renderElement: element [

	element renderOuterHtmlOn: self
]

{ #category : #rendering }
WsRenderer >> renderHeadChild: element [

	self document
		openTag: element tag
		attributes: element attributes
		closed: element isClosed.
	element isClosed ifTrue: [ ^ self ].
	element renderInnerHtmlOn: self.
	self document closeTag: element tag
]

{ #category : #rendering }
WsRenderer >> renderView: view [

	self addAllResourcesOf: view.
	view renderOuterHtmlOn: self
]

{ #category : #initialization }
WsRenderer >> resetLocalResources [

	localResources := OrderedCollection new
]
