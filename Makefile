create:
	git clone ${GIT_REPO} ${FOLDER_NAME}
	echo "Git Repo cloned."
	aws s3 mb s3://${BUCKET_NAME}
	echo "Bucket created."
	aws s3 sync ${FOLDER_NAME} s3://${BUCKET_NAME}
	echo "Website content uploaded."
	aws s3api put-bucket-website --bucket ${BUCKET_NAME} --website-configuration "{\"IndexDocument\": {\"Suffix\": \"${INDEX_DOC_PATH}\"},\"ErrorDocument\": {\"Key\": \"${ERROR_DOC_PATH}\"}}"
	aws s3api put-bucket-policy --bucket ${BUCKET_NAME} --policy '{ "Statement": [ { "Effect": "Allow", "Principal": "*", "Action": "s3:GetObject", "Resource": "arn:aws:s3:::${BUCKET_NAME}/*" } ] }'
	echo "Visit the website at : http://${BUCKET_NAME}.s3-website.${AWS_REGION}.amazonaws.com"
destroy:
	aws s3api delete-bucket-website --bucket ${BUCKET_NAME} 
	echo "Website disabled."
	aws s3api delete-bucket-policy --bucket ${BUCKET_NAME}
	echo "Bucket policy deleted."
	aws s3 rm s3://${BUCKET_NAME} --recursive
	echo "Contents deleted."
	aws s3api delete-bucket --bucket ${BUCKET_NAME} 
	echo "Bucket deleted."
	rm -rf ${FOLDER_NAME}
	echo "Folder deleted."
