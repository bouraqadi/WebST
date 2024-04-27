Class {
	#name : #WsBootstrapResources,
	#superclass : #SharedPool,
	#classVars : [
		'Bootstrap502',
		'Bootstrap533'
	],
	#category : #'WebSt-Library-Bootstrap'
}

{ #category : #accesing }
WsBootstrapResources class >> bootstrap5 [

	^ self bootstrap533 
]

{ #category : #accesing }
WsBootstrapResources class >> bootstrap502 [

	^ Bootstrap502
]

{ #category : #accesing }
WsBootstrapResources class >> bootstrap533 [

	^ Bootstrap533
]

{ #category : #'class initialization' }
WsBootstrapResources class >> initBootstrap502 [

	Bootstrap502 := WsCompositeResource withAll: {
			                (WsCssLink new
				                 url:
					                 'https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css';
				                 integrity:
					                 'sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC';
				                 crossoriginAnonymous;
				                 yourself).
			                (WsJsScript new
				                 url:
					                 'https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js';
				                 integrity:
					                 'sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM';
				                 crossoriginAnonymous;
				                 yourself) }
]

{ #category : #'class initialization' }
WsBootstrapResources class >> initBootstrap533 [
	Bootstrap533 := WsCompositeResource withAll: {
			                (WsCssLink new
				                 url:
					                 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css';
				                 integrity:
					                 'sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH';
				                 crossoriginAnonymous;
				                 yourself).
			                (WsJsScript new
				                 url:
					                 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js';
				                 integrity:
					                 'sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz';
				                 crossoriginAnonymous;
				                 yourself) }
]

{ #category : #'class initialization' }
WsBootstrapResources class >> initialize [

	self initBootstrap533.
	self initBootstrap502
]
