Class {
	#name : 'WsPage',
	#superclass : 'WsTagElement',
	#traits : 'WsTResourceFactory',
	#classTraits : 'WsTResourceFactory classTrait',
	#instVars : [
		'head',
		'body'
	],
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'instance creation' }
WsPage class >> with: aView [ 
	^self new
		addView: aView;
		yourself
]

{ #category : 'adding' }
WsPage >> addResource: aResource [

	head add: aResource
]

{ #category : 'adding' }
WsPage >> addView: aView [

	self body add: aView
]

{ #category : 'adding' }
WsPage >> addViewHtml: htmlString [

	self body add: (WsRawHtml htmlString: htmlString)
]

{ #category : 'accessing' }
WsPage >> body [

	^ body
]

{ #category : 'accessing' }
WsPage >> head [

	^ head
]

{ #category : 'initialization' }
WsPage >> initialize [

	super initialize.
	head := WsHead new.
	body := WsBody new.
]

{ #category : 'rendering' }
WsPage >> renderInnerHtmlOn: html [

	html
		render: head;
		render: body
]

{ #category : 'rendering' }
WsPage >> renderOuterHtmlOn: html [


html
		  html: '<!doctype html>'
. super renderOuterHtmlOn: html

]

{ #category : 'accessing' }
WsPage >> tag [
	^#html
]

{ #category : 'accessing' }
WsPage >> title: aString [

	self head title: aString
]
