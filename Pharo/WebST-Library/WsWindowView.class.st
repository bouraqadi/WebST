Class {
	#name : #WsWindowView,
	#superclass : #WsBootstrap5Icons1View,
	#category : #'WebST-Library-Windows'
}

{ #category : #rendering }
WsWindowView >> bodyID [
	^'windowBody'
]

{ #category : #rendering }
WsWindowView >> renderBodyOn: html [

	html div
		id: self bodyID;
		class: 'collapse show border border-1 border-dark flex-fill';
		with: [ html div class: 'mx-auto'; with: 'Body content' ]
]

{ #category : #rendering }
WsWindowView >> renderHeadingButtonOn: html class: classString iconClass: iconClasssString [

	^ html button
	bePush;
		  class: classString;
		  with: [ html icon class: iconClasssString ];
		  yourself
]

{ #category : #rendering }
WsWindowView >> renderHeadingButtonsOn: html [

	| minimizeBrush |
	self
		renderHeadingButtonOn: html
		class: 'btn btn-danger me-1'
		iconClass: 'bi bi-x-lg'.
	minimizeBrush := self
		                 renderHeadingButtonOn: html
		                 class: 'btn btn-warning me-1'
		                 iconClass: 'bi bi-dash-lg'.
	minimizeBrush
		attributeAt: 'data-bs-toggle' put: 'collapse';
		attributeAt: 'data-bs-target' put: '#' , self bodyID.
	self
		renderHeadingButtonOn: html
		class: 'btn btn-success'
		iconClass: 'bi bi-arrows-angle-expand'
]

{ #category : #rendering }
WsWindowView >> renderHeadingOn: html [

	html div
		class: 'd-flex bg bg-dark text-light p-2';
		with: [
			self renderHeadingButtonsOn: html.
			self renderHeadingTitleOn: html ]
]

{ #category : #rendering }
WsWindowView >> renderHeadingTitleOn: html [

	html div
		class: 'mx-auto align-self-center fs-3';
		with: 'WebST Window'
]

{ #category : #rendering }
WsWindowView >> renderOuterHtmlOn: html [

	html div
		class: 'd-flex flex-column';
		with: [ 
			self renderHeadingOn: html.
			self renderBodyOn: html ]
]
