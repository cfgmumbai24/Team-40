class AppError extends Error{
    constructor(statusCode, message){
        super(message);
        this.statusCode = statusCode || 500;
        this.status = statusCode.startsWith('4') ? 'fail':'error'
        Error.captureStackTrace(this, this.constructor)
    }
}